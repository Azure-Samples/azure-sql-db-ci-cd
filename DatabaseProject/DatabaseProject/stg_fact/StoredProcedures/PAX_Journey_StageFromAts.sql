
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-11-18
-- Description: Stages measures in stg_fact.PAX_Journey for a given period based on imputated measurements from ATS.
-- =============================================
CREATE procedure [stg_fact].[PAX_Journey_StageFromAts] (@Period int)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare @StartDate date;
    declare @EndDate date;

    -- Quarterly Imputation
    if len(@Period) = 5
    begin
        set @StartDate
            = dateadd(quarter, cast(right(@Period, 1) as int) - 1, cast(concat(left(@Period, 4), '0101') as date));
        set @EndDate = dateadd(day, -1, dateadd(month, 3, @StartDate));
    end;
    -- Monthly Imputation
    else if len(@Period) = 6
    begin
        set @StartDate = cast(concat(@Period, '01') as date);
        set @EndDate = dateadd(day, -1, dateadd(month, 1, @StartDate));
    end;

    print (@StartDate);
    print (@EndDate);

    truncate table [stg_fact].[PAX_Journey];

    -- Stage Data
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
        [DateKey] = [Period] * 100 + 1
       ,[SourceSystemCode] = 'ATS'
       ,[SourceSystemEntryRef] = j.[TimeUniqueJourneyPatternRef]
       ,YearMonthNo = j.[Period]
       ,j.[OperatingDayType]
       ,j.[JourneyPatternId]
       ,j.[JourneyStartTime]
       ,[GroupByKey] = ''
       ,[EnumerationRuleNumber] = j.[ImputationRule]
       ,j.[JourneyCount]
       ,j.[ObservedJourneyCount]
       ,j.[BoardingCountAvg]
       ,j.[AlightingCountAvg]
    from
        [data].[APC_ATS_TimeUniqueJourneyPatternImputed] j
    where
        -- Published data only
        j.[Published] = 1 
        -- DayType 1 -> Hverdag
        --and j.[OperatingDayType] = 1
        and j.[Period] = @Period;

end

GO

