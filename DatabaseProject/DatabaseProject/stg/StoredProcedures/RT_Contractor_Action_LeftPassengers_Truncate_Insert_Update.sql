-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE   [stg].[RT_Contractor_Action_LeftPassengers_Truncate_Insert_Update]
(
    ---- Add the parameters for the stored procedure here
	@LoadingWindowDaysBackward int
)
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    --SET NOCOUNT ON

    -- Insert statements for procedure here
    
truncate table [stg].[RT_Contractor_Action_LeftPassengers];

insert into
    [stg].[RT_Contractor_Action_LeftPassengers] (
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
   and rt.CreatedDate >= convert(date, (dateadd(d, -@LoadingWindowDaysBackward, getdate())))
;

update
    f
set
    [DateKey] = d.[DateKey]
from
   [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[Date] d on d.[Date] = cast(f.[CreatedDate] as date)
;

update
    f
set
    [TimeKey] = d.[TimeKey]
from
     [stg].[RT_Contractor_Action_LeftPassengers] f
    join [data].[RT_Journey] j on j.[JourneyRef] = f.[JourneyRef]
    join [dim].[Time] d on d.[Time] = cast(j.[PlannedStartDateTime] as time(0))
;


update
    f
set
    [SourceSystemKey] = ss.[SourceSystemKey]
from
     [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[SourceSystem] ss on ss.[Code] = f.[SourceSystemCode]
;

update
    f
set
    [OperatingDayTypeKey] = d.[OperatingDayTypeKey]
from
     [stg].[RT_Contractor_Action_LeftPassengers] f
    join [data].[RT_Journey] j on j.[JourneyRef] = f.[JourneyRef]
    join [dim].[OperatingDayType] d on d.[OperatingDayTypeNumber] = j.[OperatingDayType]
;

update
    f
set
    [ContractorKey] = d.[ContractorKey]
from
      [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[Contractor] d on  d.[ContractorCode] = f.[ContractorCode]
        and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey]
;

update
    f
set
    [LineKey] = d.[LineKey]
from
     [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[Line] d on
        d.[LineNumber] = f.[LineNumber]
        and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey]
;

update
    f
set
    [LineDirectionKey] = d.[LineDirectionKey]
from
       [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[LineDirection] d on
        d.[LineDirectionCode] = f.[LineDirectionCode]
    and d.[linekey]=f.[Linekey]
        and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey]
;

update
    f
set
    [JourneyPatternPointKey] = d.[JourneyPatternPointKey]
from
    [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[JourneyPatternPoint] d on
        d.[StopPointNumber] = f.[StopPointNumber]
        and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey]
;

update
    f
set
    [GarageKey] = d.[GarageKey]
from
      [stg].[RT_Contractor_Action_LeftPassengers] f
    join [dim].[Garage] d on
        d.[GarageCode] = f.[GarageCode]
        and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey]
;

update
    f
set
    [JourneyPatternKey] = d.[JourneyPatternKey]
from
       [stg].[RT_Contractor_Action_LeftPassengers] f
    join [data].[RT_Journey] j on j.[JourneyRef] = f.[JourneyRef]
    join [dim].[JourneyPattern] d on d.[JourneyPatternId] = j.[JourneyPatternId]
    and f.[DateKey] between d.[ValidFromDateKey] and d.[ValidToDateKey]
;
select @@rowCount;
END

GO

