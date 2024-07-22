
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-12-13
-- Description: Upserts Journey Counting Reports based on Matched (Vehicle) Counting Reports.
-- =============================================
CREATE PROCEDURE [data].[APC_ATS_JourneyCountingReport_UpsertFromCountingReport]
(
    @fromOperatingDayDate date,
    @toOperatingDayDate date
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- UTC dates that intersections with journeys from the above operating day dates. We expect that no journey proceed more than 6 hours into the next calendar date.
    declare @fromUtc datetime2(3)
        = cast(@fromOperatingDayDate as datetime2(0))at time zone 'Central European Standard Time' at time zone 'UTC';
    declare @Utc datetime2(3)
        = dateadd(
              hour
             ,30
             ,cast(@toOperatingDayDate as datetime2(0))at time zone 'Central European Standard Time' at time zone 'UTC'
          );

    -- Step 1: Truncate Staging
    truncate table [stg].[APC_ATS_JourneyCountingReport];

    -- Step 2: Split Counting Reports that differes in Boarding / Alighting
    with
    [CountingReportSplit] as
    (
        select
            [JourneyCountingReportRef] = concat([CountingReportRef], ':1')
           ,[DateTime]
           ,[JourneyRef] = [BoardingJourneyRef]
           ,[JourneyPointRef] = [BoardingJourneyPointRef]
           ,[VehicleRef]
           ,[BoardingCount]
           ,[AlightingCount] = iif(([BoardingJourneyPointRef] = [AlightingJourneyPointRef])
                                   or (
                                       [BoardingJourneyRef] = [AlightingJourneyRef]
                                       and [BoardingJourneyPointRef] is null
                                       and [AlightingJourneyPointRef] is null
                                   )
                                  ,[AlightingCount]
                                  ,0)
        from
            [data].[APC_ATS_CountingReport] (nolock)
        where
            [MatchedLocationContractorRef] is null
            and [BoardingJourneyRef] is not null
            and [DateTime] between @fromUtc and @Utc
        union all
        select
            [JourneyCountingReportRef] = concat([CountingReportRef], ':2')
           ,[DateTime]
           ,[JourneyRef] = [AlightingJourneyRef]
           ,[JourneyPointRef] = [AlightingJourneyPointRef]
           ,[VehicleRef]
           ,[BoardingCount] = 0
           ,[AlightingCount] = [AlightingCount]
        from
            [data].[APC_ATS_CountingReport] (nolock)
        where
            [MatchedLocationContractorRef] is null
            and [AlightingJourneyRef] is not null
            and [DateTime] between @fromUtc and @Utc
            and (
                -- Either, the aligting is on the same journey as bording, but matched to another point (case when both are null is handled above)
                (
                    [BoardingJourneyRef] = [AlightingJourneyRef]
                    and [BoardingJourneyPointRef] <> [AlightingJourneyPointRef]
                )
                -- Or, the aligting is is not on the same journey as bording (handling case when bording journey is null)
                or (
                    [BoardingJourneyRef] <> [AlightingJourneyRef]
                    or [BoardingJourneyRef] is null
                )
            )
    )
    ,
    [CountingReportSplitWithJourneyCount] as
    (
        select
            *
           ,[JourneyBoardingCount] = sum(apc.[BoardingCount]) over (partition by apc.[VehicleRef], apc.[JourneyRef])
           ,[JourneyAlightingCount] = sum(apc.[AlightingCount]) over (partition by apc.[VehicleRef], apc.[JourneyRef])
           ,[MinDate] = min(calc.[Date]) over (partition by apc.[VehicleRef], apc.[JourneyRef])
           ,[MaxDate] = max(calc.[Date]) over (partition by apc.[VehicleRef], apc.[JourneyRef])
        from
            [CountingReportSplit] apc
            cross apply (select [Date] = cast([DateTime] as date)) calc
    )
    ,
    [CountingReportSplitWithJourneyBalance] as
    (
        select
            *
           ,[JourneyBalance] = iif([JourneyBoardingCount] + [JourneyAlightingCount] > 0
                                  ,1
                                   - abs(1.0 * ([JourneyBoardingCount] - [JourneyAlightingCount])
                                         / ([JourneyBoardingCount] + [JourneyAlightingCount])
                                     )
                                  ,null)
        from
            [CountingReportSplitWithJourneyCount]
    )
    insert into
        [stg].[APC_ATS_JourneyCountingReport]
    (
        [JourneyCountingReportRef]
       ,[DateTime]
       ,[JourneyRef]
       ,[JourneyPointRef]
       ,[OperatingDayDate]
       ,[VehicleRef]
       ,[BoardingCount]
       ,[AlightingCount]
       ,[JourneyBoardingCount]
       ,[JourneyAlightingCount]
       ,[JourneyBalance]
       ,[StartDailyVehicleBalance]
       ,[EndDailyVehicleBalance]
       ,[CrossesUtcDate]
    )
    select
        [apc].[JourneyCountingReportRef]
       ,[apc].[DateTime]
       ,[apc].[JourneyRef]
       ,[apc].[JourneyPointRef]
       ,[j].[OperatingDayDate]
       ,[apc].[VehicleRef]
       ,[apc].[BoardingCount]
       ,[apc].[AlightingCount]
       ,[apc].[JourneyBoardingCount]
       ,[apc].[JourneyAlightingCount]
       ,[apc].[JourneyBalance]
       ,[StartDailyVehicleBalance] = dvb1.[DailyVehicleBalance]
       ,[EndDailyVehicleBalance] = dvb2.[DailyVehicleBalance]
       ,[CrossesUtcDate] = cast(iif(apc.[MinDate] <> apc.[MaxDate], 1, 0) as bit)
    from
        [CountingReportSplitWithJourneyBalance] apc
        --join data.[RT_JourneyPoint] p on [p].[JourneyPointRef] = [apc].[JourneyPointRef]
        join data.[RT_Journey] j on
            j.[JourneyRef] = [apc].[JourneyRef]
        --join dim.[JourneyPatternPoint] jpp on jpp.[JourneyPatternPointGid] = p.[JourneyPatternPointGid] and jpp.[IsCurrent] = 1
        left join [data].[APC_ATS_DailyVehicleBalance] dvb1 on
            dvb1.[Date] = apc.[MinDate]
            and dvb1.[VehicleRef] = apc.[VehicleRef]
        left join [data].[APC_ATS_DailyVehicleBalance] dvb2 on
            dvb2.[Date] = apc.[MaxDate]
            and dvb2.[VehicleRef] = apc.[VehicleRef]
    where
        j.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate;

    -- Step 3: Set IsReady based on Business Rules
    with
    [IsReady] as
    (
        select
            [IsReady]
           ,[_IsReady] = case
                             -- Only one Vehicle should have counted the Journey.
                             when min([VehicleRef]) over (partition by [JourneyRef]) <> max([VehicleRef]) over (partition by [JourneyRef]) then
                                 0
							 --AHN 3/6-2022: Upon request from CAJ. Only journeys that have  Boarders or Alighters should be Ready (0-journeys)
							 when JourneyAlightingCount = 0 
								  and JourneyBoardingCount = 0 then 0
                             -- If journey is confined within a single UTC Date, use if Daily Vehicle Balance > 95%.
                             when [CrossesUtcDate] = 0
                                  and [StartDailyVehicleBalance] > .95 then 1
                             -- If journey is confined within a single UTC Date, use if Daily Vehicle Balance > 90% and absolute difference in Boarding and Alighting count < 6.
                             when [CrossesUtcDate] = 0
                                  and [StartDailyVehicleBalance] > .90
                                  and abs([JourneyBoardingCount] - [JourneyAlightingCount]) < 6 then 1
                             -- If journey spanning two UTC Dates, use if both Daily Vehicle Balance > 95%.
                             when [CrossesUtcDate] = 1
                                  and [StartDailyVehicleBalance] > .95
                                  and [EndDailyVehicleBalance] > .95 then 1
                             -- If journey spanning two UTC Dates, use if either Daily Vehicle Balance > 90% and absolute difference in Boarding and Alighting count < 6.
                             when [CrossesUtcDate] = 1
                                  and ([StartDailyVehicleBalance] > .90 or [EndDailyVehicleBalance] > .90)
                                  and abs([JourneyBoardingCount] - [JourneyAlightingCount]) < 6 then 1
                             -- Otherwise, discard the report
                             else 0
                         end
        from
            [stg].[APC_ATS_JourneyCountingReport]
    )
    update
        [IsReady]
    set
        [IsReady] = _IsReady;

    -- Step 4: Auto Merge
    exec [integration].[AutoMerge]
        @Source = N'[stg].[APC_ATS_JourneyCountingReport]'
       ,@Target = N'[data].[APC_ATS_JourneyCountingReport]'
       ,@Mode = 1;

    -- Step 5: Delete unstaged rows in the given period. Not sure if this will ever happend.
    delete
    t
    from
        [data].[APC_ATS_JourneyCountingReport] t
        left join [stg].[APC_ATS_JourneyCountingReport] s on
            s.[JourneyCountingReportRef] = t.[JourneyCountingReportRef]
    where
        t.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
        and s.[JourneyCountingReportRef] is null;

    -- Step 6: Truncate Staging
    truncate table [stg].[APC_ATS_JourneyCountingReport];
END

GO

