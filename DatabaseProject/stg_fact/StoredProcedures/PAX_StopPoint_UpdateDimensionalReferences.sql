-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-02-15
-- Description:  Updates dimensional reference for staged data in stg_fact.PAX_StopPoint
-- =============================================
create procedure [stg_fact].[PAX_StopPoint_UpdateDimensionalReferences]
as
begin

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    update
        s
    set
        [SourceSystemKey] = isnull(src.[SourceSystemKey], -1),
        [TimeKey] = isnull(t.[TimeKey], -1),
        [OperatingDayTypeKey] = isnull(odt.[OperatingDayTypeKey], -1),
        [EnumerationRuleKey] = isnull(r.[EnumerationRuleKey], -1),
        [JourneyPatternKey] = isnull(jp.[JourneyPatternKey], -1),
        [StopPointKey] = isnull(sp.[StopPointKey], -1)
    from
        [stg_fact].[PAX_StopPoint] s
        left join [dim].[SourceSystem] src on src.[Code] = s.[SourceSystemCode]
        left join [dim].[Time] t on t.[Time] = s.[JourneyStartTime]
        left join [dim].[OperatingDayType] odt on odt.[OperatingDayTypeNumber] = s.[TypeOfDay]
        left join [dim].[PAX_EnumerationRule] r on r.[EnumerationRuleNumber] = s.[EnumerationRuleNumber]
        left join [dim].[JourneyPattern] jp on jp.[JourneyPatternId] = s.[JourneyPatternId] and s.[DateKey] between jp.[ValidFromDateKey] and jp.[ValidToDateKey]
        left join [dim].[StopPoint] sp on sp.[StopPointOwner] = 200 and sp.[StopPointNumber] = s.[StopPointNumber] and s.[DateKey] between sp.[ValidFromDateKey] and sp.[ValidToDateKey];

end;

GO

