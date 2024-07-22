
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-11-18
-- Description: Updates dimensional reference for staged data in stg_fact.PAX_Journey
-- =============================================
CREATE procedure [stg_fact].[PAX_Journey_UpdateDimensionalReferences]
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Update Dimensional References
    update
        f
    set
        [SourceSystemKey] = s.[SourceSystemKey]
    from
        [stg_fact].[PAX_Journey] f
        join [dim].[SourceSystem] s on
            s.[Code] = f.[SourceSystemCode];

    update
        f
    set
        [OperatingDayTypeKey] = d.[OperatingDayTypeKey]
    from
        [stg_fact].[PAX_Journey] f
        join [dim].[OperatingDayType] d on
            d.[OperatingDayTypeNumber] = f.[TypeOfDate];

    update
        f
    set
        [TimeKey] = d.[TimeKey]
    from
        [stg_fact].[PAX_Journey] f
        join [dim].[Time] d on
            d.[Time] = f.[JourneyStartTime];

    update
        f
    set
        [JourneyPatternKey] = d.[JourneyPatternKey]
    from
        [stg_fact].[PAX_Journey] f
        join [dim].[JourneyPattern] d on
            d.[JourneyPatternId] = f.[JourneyPatternId]
            and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey];

    update
        f
    set
        [EnumerationRuleKey] = d.[EnumerationRuleKey]
    from
        [stg_fact].[PAX_Journey] f
        join [dim].[PAX_EnumerationRule] d on
            d.[EnumerationRuleNumber] = f.[EnumerationRuleNumber]
            and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey];



end;

GO

