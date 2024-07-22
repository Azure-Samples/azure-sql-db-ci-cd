
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-02-15
-- Description: Stages measures in stg_fact.PAX_Journey for a given period based on imputated measurements from APC.
-- =============================================
create procedure [stg_fact].[PAX_Journey_StageFromApc] (@Period int, @Correction bit = 0)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare @StartDate date;
    declare @EndDate date;
    declare @DayTypeGroup int -- 1 = Hverdag, 2 = Lør, Søn og Helligdag

    -- Quarterly Imputation
    if len(@Period) = 5
    begin
        set @StartDate
            = dateadd(quarter, cast(right(@Period, 1) as int) - 1, cast(concat(left(@Period, 4), '0101') as date));
        set @EndDate = dateadd(day, -1, dateadd(month, 3, @StartDate));
        set @DayTypeGroup = 2
    end;
    -- Monthly Imputation
    else if len(@Period) = 6
    begin
        set @StartDate = cast(concat(@Period, '01') as date);
        set @EndDate = dateadd(day, -1, dateadd(month, 1, @StartDate));
        set @DayTypeGroup = 1
    end;

    print (@StartDate);
    print (@EndDate);

    truncate table [stg_fact].[PAX_Journey];

    -- Stage Data
    with
    -- For Monthly Periods, this just calculates a 1-to-1 distribution.
    -- For Quarterly Periods, this distributes JourneyCount based on planned data.
    [MonthDistribution] as
    (
        select
            [OperatingDayType] = j.[OperatingDayType]
           ,[JourneyPatternId] = j.[JourneyPatternId]
           ,[JourneyStartTime] = calc.[JourneyStartTime]
           ,[YearMonthNo] = d.[YearMonthNo]
           ,[DateKey] = min([DateKey])
           ,[JourneyCountMonth] = count(1)
           ,[JourneyCountPriod] = sum(count(1)) over (partition by
                                                          calc.[JourneyStartTime]
                                                         ,j.[JourneyPatternId]
                                                         ,j.[OperatingDayType]
                                                )
        from
            [data].[RT_Journey] j
            join [dim].[Date] d on
                j.[OperatingDayDate] = d.[Date]
            cross apply (
            select
                [JourneyStartTime] = left(convert(varchar(8), j.[PlannedStartDateTime], 108), 5)
        ) calc
        where
            j.[OperatingDayDate] between @StartDate and @EndDate
            -- DayType 1 -> Hverdag. Eq. of @DayTypeGroup = 1 -> DayType = 1
            and (not @DayTypeGroup = 1 or j.[OperatingDayType] = 1)
            -- DayType 2, 3 -> Lør, Søn og Helligdag. Eq. of @DayTypeGroup = 2 -> DayType in (2, 3)
            and (not @DayTypeGroup = 2 or j.[OperatingDayType] in ( 2, 3 ))
        group by
            j.[OperatingDayType]
           ,j.[JourneyPatternId]
           ,calc.[JourneyStartTime]
           ,d.YearMonthNo
    )
    insert into
        [stg_fact].[PAX_Journey]
    (
        [DateKey]
       ,[SourceSystemCode]
       ,[SourceSystemEntryRef]
       ,[YearMonthNo]
       ,[TypeOfDate]
       ,[JourneyPatternId]
       ,[JourneyStartTime]
       ,[GroupByKey]
       ,[EnumerationRuleNumber]
       ,[JourneyCount]
       ,[ObservationCount]
       ,[BoardersAvg]
       ,[AlightersAvg]
    )
    select
        [DateKey] = dist.[DateKey]
       ,j.[SourceSystemCode]
       ,[SourceSystemEntryRef] = null
       ,[YearMonthNo] = dist.[YearMonthNo]
       ,j.[TypeOfDate]
       ,j.[JourneyPatternId]
       ,j.[JourneyStartTime]
       ,j.[GroupByKey]
       ,j.[EnumerationRule]
       ,j.[JourneyCount] * 1.0 * dist.[JourneyCountMonth] / dist.[JourneyCountPriod]
       ,j.[ObservationCount] * 1.0 * dist.[JourneyCountMonth] / dist.[JourneyCountPriod]
       ,j.[BoardersAvg]
       ,j.[AlightersAvg]
    from
        [data].[APC_JourneyPatternEnumerated] j
        join [MonthDistribution] dist on
            dist.[OperatingDayType] = j.[TypeOfDate]
            and dist.[JourneyPatternId] = j.[JourneyPatternId]
            and dist.[JourneyStartTime] = j.[JourneyStartTime]
    where
        j.[SourceSystemCode] = iif(@Correction = 1, 'APC_C', 'APC')
        -- Published data only
        and j.[Published] = 1
        -- DayType 1 -> Hverdag. Eq. of @DayTypeGroup = 1 -> DayType = 1
        and (not @DayTypeGroup = 1 or j.[TypeOfDate] = 1)
        -- DayType 2, 3 -> Lør, Søn og Helligdag. Eq. of @DayTypeGroup = 2 -> DayType in (2, 3)
        and (not @DayTypeGroup = 2 or j.[TypeOfDate] in ( 2, 3 ))
        and j.[Period] = @Period;

end;

GO

