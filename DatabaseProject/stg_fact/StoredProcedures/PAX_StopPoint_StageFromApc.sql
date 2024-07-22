
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-02-15
-- Description: Stages measures in stg_fact.PAX_StopPoint for a given period based on imputated measurements from APC.
-- =============================================
CREATE procedure [stg_fact].[PAX_StopPoint_StageFromApc] (@Period int)
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

    truncate table [stg_fact].[PAX_StopPoint];

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
        [stg_fact].[PAX_StopPoint]
    (
        [DateKey]
       ,[SourceSystemCode]
       ,[SourceSystemEntryId]
       ,[Period]
       ,[TypeOfDay]
       ,[LineNumber]
       ,[LineDesignation]
       ,[JourneyPatternId]
       ,[DirectionCode]
	   ,[StartJourneyPatternPointNumber]
	   ,[JourneyPatternPointCount]
	   ,[JourneyStartTime]
       ,[JourneyCount]
       ,[StopPointNumber]
       ,[SequenceNumber]
	   ,[EnumerationRuleNumber]
	   ,[BoardersWeightAvg]
	   ,[AlightersWeightAvg]
    )
    select
        [DateKey] = dist.[DateKey]
       ,s.[SourceSystemCode]
       ,[SourceSystemEntryRef] = null
       ,@Period
       ,s.[TypeOfDate]
       ,s.[LineNumber]
       ,s.[LineDesignation]
       ,s.[JourneyPatternId]
       ,s.[DirectionCode]
       ,s.[StartJourneyPatternPointNumber]
       ,s.[JourneyPatternPointCount]
       ,s.[JourneyStartTime]
       ,s.[JourneyCount]
       ,s.[StopPointNumber]
       ,s.[SequenceNumber]
       ,s.[CallEnumerationRule]
       ,s.[BoardersWeightAvg]
       ,s.[AlightersWeightAvg]
    from
        [data].[APC_CallEnumerated] s
        join [MonthDistribution] dist on
            dist.[OperatingDayType] = s.[TypeOfDate]
            and dist.[JourneyPatternId] = s.[JourneyPatternId]
            and dist.[JourneyStartTime] = s.[JourneyStartTime]
    where
        s.[SourceSystemCode] = 'APC'
        -- Published data only
        and s.[Published] = 1
        -- DayType 1 -> Hverdag. Eq. of @DayTypeGroup = 1 -> DayType = 1
        and (not @DayTypeGroup = 1 or s.[TypeOfDate] = 1)
        -- DayType 2, 3 -> Lør, Søn og Helligdag. Eq. of @DayTypeGroup = 2 -> DayType in (2, 3)
        and (not @DayTypeGroup = 2 or s.[TypeOfDate] in ( 2, 3 ))
        and s.[Period] = @Period
        and s.[StopPointNumber] is not null;

end;

GO

