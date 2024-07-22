
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-25-14
-- Description: Updates RT_Journey with RPS-matching data.
-- Parameters:  @date : The UTC date to update matching for. The 
-- 2023-10-30 LSI: Added [Updated] =  sysdatetime()
-- =============================================
CREATE procedure [data].[RT_Journey_UpdateTrackingFromRps]
(
    @date date
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    /* Step 1: Update with manual assignments, i.e. RPS_Matching_VehicleJourneyAssignment. */
    with
    [ManualAssignment] as 
    (
        select
            vja.[JourneyRef],
            vja.[VehicleId],
            vja.[DeviceId],
            [TotalReportCount] = sum(vja.[TotalPositionCount]),
            [FaultyReportCount] = sum(vja.[NoGpsFixCount] + vja.[LowGpsQualityCount] + vja.[RepeatedPositionCount]),    
            [ObservedCoverageSeconds] = sum(vja.[ObservedCoverageSeconds]),
            [ObservedCoverage] = CASE WHEN 	   sum(vja.[ObservedCoverageSeconds]) = 0 THEN 		  SUM(vja.[ObservedCoverage])/COUNT(1)
			ELSE                
			SUM(vja.[ObservedCoverageSeconds] * vja.[ObservedCoverage]) / sum(vja.[ObservedCoverageSeconds])
			END, 
            [Rank] = row_number() over (partition by vja.[JourneyRef] order by sum(vja.[ObservedCoverageSeconds]) desc)
        FROM
            [data].[RPS_Matching_VehicleJourneyAssignment] vja
        where
            vja.[JourneyRef] is not null
            and vja.[FromDateTimeUtc] < DATEADD(day, 1, @date) 
            and @date <= vja.[ToDateTimeUtc]
        group by
            vja.[JourneyRef],
            vja.[VehicleId],
            vja.[DeviceId]
    )
    update
        j
    set
        [PrimaryVehicleAssignmentType] = 1,
        [TrackingSourceSystemCode] = 'RPS',
        [PrimaryTrackingTotalReportCount] = ma.[TotalReportCount],
        [PrimaryTrackingFaultyReportCount] = ma.[FaultyReportCount],
        [PrimaryTrackingObservedCoverage] = ma.[ObservedCoverage],
        [PrimaryTrackingObservedCoverageSeconds] = ma.[ObservedCoverageSeconds],
		[Updated] =  sysdatetime()
    from
        [ManualAssignment] ma
        join [data].[RT_Journey] j on j.[JourneyRef] = ma.[JourneyRef]
    where
        ma.[Rank] = 1 
        -- This handles rare cases where multiple assignements exists just around midnight.
        -- We will try to maximize this in favour of the operator.
        and ma.[ObservedCoverage] >= isnull(j.[PrimaryTrackingObservedCoverage], 0);

    /* Step 2: Automatic Assignment */
    with
    [UntrackedJourney] as 
    (
        select
            j.[JourneyRef]
           ,[VehicleId] = cast(vja.[VehicleNumber] as nvarchar(255))
           ,calc.[AssignedFromUtc]
           ,calc.[AssignedToUtc]
        from
            [data].[RT_Journey] j
            join data.[RT_VehicleJourneyAssignment] vja on
                vja.[JourneyRef] = j.[JourneyRef]
                and vja.[SourceSystemCode] = 'PT'
            cross apply (
                select
                    [AssignedFromUtc] = cast(vja.[AssignedFromDateTime] at time zone 'Central European Standard Time' at time zone 'UTC' as datetime2(3))
                   ,[AssignedToUtc] = cast(vja.[AssignedToDateTime] at time zone 'Central European Standard Time' at time zone 'UTC' as datetime2(3))
            ) calc
        where
            j.[OperatingDayDate] between dateadd(day, -1, @date) and dateadd(day, 1, @date)
            and @date <= calc.[AssignedToUtc]
            and calc.[AssignedFromUtc] < dateadd(day, 1, @date)
            and j.[TrackingSourceSystemCode] is null
    ),
    [PositionQuality] as
    (
        select
            vja.[JourneyRef],
            [VehicleId] = try_cast(p.[VehicleId] as int),
            p.[UnitIdentity],
            p.[SendDateTime],
            [NoGpsFix] = case when p.[GpsFixType] = 0 then 1 else 0 end,
            [LowGpsQuality] = case when p.[GpsQuality] = 15 then 1 else 0 end,
            [RepeatedPosition] = case
                /* Position is counted as invalid, speed indicate movement, but lat/lng is not updated */
                when [Latitude] = lag(p.[Latitude]) over (partition by p.[VehicleId], p.[UnitIdentity] order by p.[SendDateTime])
                    and [Longitude] = lag(p.[Longitude]) over (partition by p.[VehicleId], p.[UnitIdentity] order by p.[SendDateTime])
                    and [Speed] > 5 
                    and lag([Speed]) over (partition by p.[VehicleId], p.[UnitIdentity] order by p.[SendDateTime]) > 5 then 1
                else 0 
            end,
            [RegularCoverageMs] =
            case
                when datediff(millisecond, lag(p.[SendDateTime]) over (partition by p.[VehicleId], p.[UnitIdentity] order by p.[SendDateTime]), [SendDateTime]) <= 2000
                    then datediff(millisecond, lag(p.[SendDateTime]) over (partition by p.[VehicleId], p.[UnitIdentity] order by p.[SendDateTime]), [SendDateTime])
            end
        from
            [UntrackedJourney] vja
            join [data].[RPS_PositionMessage] p (nolock) on p.[VehicleId] = vja.[VehicleId] and 
            p.[SendDateTime] between vja.[AssignedFromUtc] and vja.[AssignedToUtc]
    ),
    [JourneyTracking] as 
    (
        select
            p.[JourneyRef],
            p.[VehicleId],
            p.[UnitIdentity],
            [FromDateTimeUtc] = min(p.[SendDateTime]),
            [ToDateTimeUtc] = max(p.[SendDateTime]),
            [FaultyReportCount] = sum(p.[NoGpsFix] + p.[LowGpsQuality] + p.[RepeatedPosition]),   
            [TotalReportCount] = count(p.[VehicleId]),       
            [ObservedCoverageSeconds] = sum(p.[RegularCoverageMs]) / 1000,
            [ObservedCoverage] =
            case
                when datediff(second, min(p.[SendDateTime]), max(p.[SendDateTime])) < sum([RegularCoverageMs]) / 1000.0 then 1
                when datediff(second, min(p.[SendDateTime]), max(p.[SendDateTime])) = 0 then 0
                else sum([RegularCoverageMs]) / 1000.0 / datediff(second, min(p.[SendDateTime]), max(p.[SendDateTime]))
            end,
            [Rank] = row_number() over (partition by p.[JourneyRef] order by sum(p.[RegularCoverageMs]) desc)
        from
            [PositionQuality] p
        group by
            p.[JourneyRef],
            p.[VehicleId],
            p.[UnitIdentity]
        having
            min(p.[SendDateTime]) < max(p.[SendDateTime])
    )
    update
        j
    set
        [PrimaryVehicleAssignmentType] = 2,
        [TrackingSourceSystemCode] = 'RPS',
        [PrimaryTrackingTotalReportCount] = jt.[TotalReportCount],
        [PrimaryTrackingFaultyReportCount] = jt.[FaultyReportCount],
        [PrimaryTrackingObservedCoverage] = jt.[ObservedCoverage],
        [PrimaryTrackingObservedCoverageSeconds] = jt.[ObservedCoverageSeconds],
		[Updated] =  sysdatetime()
    from
        [JourneyTracking] jt
        join [data].[RT_Journey] j on j.[JourneyRef] = jt.[JourneyRef]
    where
        jt.[Rank] = 1 
        -- This handles rare cases where multiple assignements exists just around midnight.
        -- We will try to maximize this in favour of the operator.
        and jt.[ObservedCoverage] >= isnull(j.[PrimaryTrackingObservedCoverage], 0)

end

GO

