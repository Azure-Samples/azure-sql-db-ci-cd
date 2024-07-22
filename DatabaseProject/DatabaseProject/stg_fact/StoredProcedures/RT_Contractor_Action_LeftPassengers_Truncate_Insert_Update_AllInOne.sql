




-- =============================================
-- Author:      Ran Wang
-- Create Date: 2021-10-06
-- Description: Truncates and Stages data into [stg_fact][RT_Contractor_Action_LeftPassengers] from [data].[RT_Contractor_Action], lookups dimensions.
-- =============================================
CREATE procedure [stg_fact].[RT_Contractor_Action_LeftPassengers_Truncate_Insert_Update_AllInOne]
(
    ---- Add the parameters for the stored procedure here
    @LoadingWindowDaysBackward int
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    --SET NOCOUNT ON

    -- Insert statements for procedure here

    truncate table [stg_fact].[RT_Contractor_Action_LeftPassengers];

    insert into
        [stg_fact].[RT_Contractor_Action_LeftPassengers]
    (
        [JourneyRef]
       ,[JourneyPointRef]
       ,[SourceSystemKey]
       ,[DateKey]
       ,[TimeKey]
       ,[OperatingDayTypeKey]
       ,[ContractorKey]
       ,[GarageKey]
       ,[LineKey]
       ,[LineDirectionKey]
       ,[JourneyPatternKey]
       ,[JourneyPatternPointKey]
       ,[StopPointKey]
       ,[ActionType]
       ,[CreatedDate]
       ,[ContractorCode]
       ,[GarageCode]
       ,[VehicleNumber]
       ,[LineNumber]
       ,[LineDirectionCode]
       ,[DepartureTimeFromOrigin]
       ,[DepartureTimeFromStop]
       ,[StopPointNumber]
       ,[LeftPassengersCount]
       ,[BabyCarriageLeft]
       ,[Note]
       ,[Comment]
       ,[CommentDate]
       ,[SourceSystemCode]
       ,[SourceSystemEntryRef]
    )
    select
        rt.[JourneyRef]
       ,rt.[JourneyPointRef]
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,-1
       ,rt.[ActionType]
       ,rt.[CreatedDate]
       ,rt.[ContractorCode]
       ,rt.[GarageCode]
       ,rt.[VehicleNumber]
       ,rt.[LineNumber]
       ,rt.[LineDirectionCode]
       ,rt.[DepartureTimeFromOrigin]
       ,rt.[DepartureTimeFromStop]
       ,rt.[StopPointNumber]
       ,rt.[LeftPassengersCount]
       ,rt.[BabyCarriageLeft]
       ,rt.[Note]
       ,rt.[Comment]
       ,rt.[CommentDate]
       ,rt.[SourceSystemCode]
       ,rt.[SourceSystemEntryRef]
    from
        [data].[RT_Contractor_Action] rt
    where
        rt.ActionType = 'LeftPassengers'
        and rt.CreatedDate >= convert(date, (dateadd(d, -@LoadingWindowDaysBackward, getdate())));

	 select
        @@rowCount;

    update
        f
    set
        [DateKey] = d.[DateKey]
       ,[TimeKey] = t.[TimeKey]
       ,[SourceSystemKey] = ss.[SourceSystemKey]
       ,[OperatingDayTypeKey] = dt.[OperatingDayTypeKey]
       ,[ContractorKey] = c.[ContractorKey]
       ,[LineKey] = l.[LineKey]
       ,[LineDirectionKey] = ld.[LineDirectionKey]
       ,[JourneyPatternPointKey] = jpp.[JourneyPatternPointKey]
       ,[GarageKey] = g.[GarageKey]
    from
        [stg_fact].[RT_Contractor_Action_LeftPassengers] f
        left join [dim].[Date] d on
            d.[Date] = cast(f.[CreatedDate] as date)
        left join [data].[RT_Journey] j on
            j.[JourneyRef] = f.[JourneyRef]
        left join [dim].[Time] t on
            t.[Time] = cast(j.[PlannedStartDateTime] as time(0))
        left join [dim].[SourceSystem] ss on
            ss.[Code] = f.[SourceSystemCode]
        left join [dim].[OperatingDayType] dt on
            dt.[OperatingDayTypeNumber] = j.[OperatingDayType]
        left join [dim].[Contractor] c on
            c.[ContractorCode] = f.[ContractorCode]
            and d.[DateKey] between c.[ValidFromDateKey] and c.[ValidToDateKey]
        left join [dim].[Line] l on
            l.[LineNumber] = f.[LineNumber]
            and d.[DateKey] between l.[ValidFromDateKey] and l.[ValidToDateKey]
        left join [dim].[LineDirection] ld on
            ld.[LineDirectionCode] = f.[LineDirectionCode]
            and ld.[LineKey] = l.[LineKey]
            and d.[DateKey] between ld.[ValidFromDateKey] and ld.[ValidToDateKey]
        left join [dim].[JourneyPatternPoint] jpp on
            jpp.[StopPointId] = f.[StopPointNumber]
            and d.[DateKey] between jpp.[ValidFromDateKey] and jpp.[ValidToDateKey]
        left join [dim].[Garage] g on
            g.[GarageCode] = f.[GarageCode]
            and d.[DateKey] between g.[ValidFromDateKey] and g.[ValidToDateKey]
        left join [dim].[JourneyPattern] jp on
            jp.[JourneyPatternId] = j.[JourneyPatternId]
            and d.[DateKey] between jp.[ValidFromDateKey] and jp.[ValidToDateKey];

    select
        @@rowCount;
end;

GO

