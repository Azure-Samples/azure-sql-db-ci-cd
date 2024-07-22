

-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-01-04
-- Description: Matches RPS Vehicle Position to Journeys based on the Service Journey Id (Driver Assignment)
-- =============================================
CREATE procedure [stg].[RPS_Matching_VehicleJourneyAssignment_UpsertFromVehiclePosition]
(
    @date date
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    truncate table [stg].[RPS_Matching_VehicleJourneyAssignment];

    /* Add some buffer around, so we are sure to also capture assignements across the UTC date line */
    declare @_fromDateTimeUtc datetime2(3) = dateadd(hour, -4, cast(@date as datetime2(3)));
    declare @_toDateTimeUtc datetime2(3) = dateadd(hour, 25, cast(@date as datetime2(3)));

    with
    [PositionQuality] as
    (
        select
            [VehicleId] = try_cast([VehicleId] as int),
            [UnitIdentity],
            [SendDateTime],
            [ServiceJourneyId],
            [ServiceJourneyChange] = case
                when lag([SendDateTime]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime]) is null then 1
                when isnull([ServiceJourneyId], '') <> isnull(lag([ServiceJourneyId]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime]), '') then 1
                else 0
            end,
            [NoGpsFix] = case when [GpsFixType] = 0 then 1 end,
            [LowGpsQuality] = case when [GpsQuality] = 15 then 1 end,
            [RepeatedPosition] = case
                /* Position is counted as invalid, speed indicate movement, but lat/lng is not updated */
                when [Latitude] = lag([Latitude]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime])
                    and [Longitude] = lag([Longitude]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime])
                    and [Speed] > 5 
                    and lag([Speed]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime]) > 5 then 1
            end,
            [RegularCoverageMs] =
            case
                when datediff(millisecond, lag([SendDateTime]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime]), [SendDateTime]) <= 2000
                    then datediff(millisecond, lag([SendDateTime]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime]), [SendDateTime])
            end
        from
            [data].[RPS_PositionMessage] (nolock)
        where
            [SendDateTime] between @_fromDateTimeUtc and @_toDateTimeUtc
            and abs(datediff(second, [SendDateTime], [ReceivedDateTime])) < 60
            and try_cast([VehicleId] as int) is not null
            and ([ServiceJourneyId] is null or len([ServiceJourneyId]) <= 20)
    ),
    [ServiceJourneySequence] as
    (
        select
            *,
            [ServiceJourneySequenceNo] = sum([ServiceJourneyChange]) over (partition by [VehicleId], [UnitIdentity] order by [SendDateTime])
        from
            [PositionQuality]
    ),
    [JourneyTracking] as 
    (
        select
            p.[VehicleId],
            p.[UnitIdentity],
            p.[ServiceJourneySequenceNo],
            p.[ServiceJourneyId],
            [FromDateTimeUtc] = min(p.[SendDateTime]),
            [ToDateTimeUtc] = max(p.[SendDateTime]),
            [NoGpsFixCount] = count(p.[NoGpsFix]),   
            [LowGpsQualityCount] = count(p.[LowGpsQuality]),   
            [RepeatedPositionCount] = count(p.[RepeatedPosition]),   
            [TotalPositionCount] = count(p.[VehicleId]),       
            [ObservedCoverageSeconds] = sum([RegularCoverageMs]) / 1000,
            [ObservedCoverage] =
            case
                when datediff(second, min(p.[SendDateTime]), max(p.[SendDateTime])) < sum([RegularCoverageMs]) / 1000.0 then 1
                when datediff(second, min(p.[SendDateTime]), max(p.[SendDateTime])) = 0 then 0
                else sum([RegularCoverageMs]) / 1000.0 / datediff(second, min(p.[SendDateTime]), max(p.[SendDateTime]))
            end
        from
            [ServiceJourneySequence] p
        where
            [ServiceJourneyId] is not null
        group by
            p.[VehicleId],
            p.[UnitIdentity],
            p.[ServiceJourneySequenceNo],
            p.[ServiceJourneyId]
        having
            min(p.[SendDateTime]) < max(p.[SendDateTime])
    )
    insert into 
        [stg].[RPS_Matching_VehicleJourneyAssignment] (
            [VehicleId],
            [DeviceId],
            [FromDateTimeUtc],
            [ToDateTimeUtc],
            [ServiceJourneyId],
            [NoGpsFixCount],
            [LowGpsQualityCount],
            [RepeatedPositionCount],
            [TotalPositionCount],
            [ObservedCoverageSeconds],
            [ObservedCoverage],
            [MatchType],
            [MatchTimestamp]
        )
    select
        p.[VehicleId],
        p.[UnitIdentity],
        p.[FromDateTimeUtc],
        p.[ToDateTimeUtc],
        p.[ServiceJourneyId],
        p.[NoGpsFixCount],
        p.[LowGpsQualityCount],
        p.[RepeatedPositionCount],
        p.[TotalPositionCount],
        p.[ObservedCoverageSeconds],
        p.[ObservedCoverage],
        1,
        sysutcdatetime()
    from
        [JourneyTracking] p
    where
        -- Must end on the date that we are processing
        [ToDateTimeUtc] < dateadd(day, 1, @date)
        -- Must start on the date we are processing, or not be the first journey in the lag window.
        and (@date <= [FromDateTimeUtc] or [ServiceJourneySequenceNo] > 1);

    -- Match Journey Ref
    with
    [RPS_Matching_Journey] as (
        select
            [ServiceJourneyId],
            [PlannedStartDateTimeUtc],
            [PlannedEndDateTimeUtc],
            [JourneyRef]
        from
            [data].[RT_Journey] j
            cross apply (
                select
                    [ServiceJourneyId] = cast(j.[JourneyNumber] as nvarchar(4)) + '.' + cast(j.[LineNumber] as nvarchar(4)) + '.lines',
                    [PlannedStartDateTimeUtc] = cast(j.[PlannedStartDateTime] at time zone 'Central European Standard Time' at time zone 'UTC' as datetime2(0)),
                    [PlannedEndDateTimeUtc] = cast(j.[PlannedEndDateTime] at time zone 'Central European Standard Time' at time zone 'UTC' as datetime2(0))
            ) calc
        where
            j.[OperatingDayDate] between dateadd(day, -1, @date) and dateadd(day, 1, @date)
    )
    update
        p
    set
        [JourneyRef] = j.[JourneyRef]
    from
        [stg].[RPS_Matching_VehicleJourneyAssignment] p  
        left join [RPS_Matching_Journey] j on 
            j.[ServiceJourneyId] = p.[ServiceJourneyId]
            -- Allow for 10 minute buffer according to Business Rule for Assignment Service.
            and p.[FromDateTimeUtc] < dateadd(minute, 10, j.[PlannedEndDateTimeUtc])
            and j.[PlannedStartDateTimeUtc] < p.[ToDateTimeUtc];

end

GO

