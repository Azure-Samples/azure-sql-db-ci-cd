
create view [data].[RT_Journey_Future_NoLock]
as(
select
    [JourneyRef]
   ,[SourceSystemCode]
   ,[SourceSystemEntryRef]
   ,[OperatingDayDate]
   ,[OperatingDayType]
   ,[LineNumber]
   ,[LineDesignation]
   ,[JourneyNumber]
   ,[JourneyPatternId]
   ,[TimedJourneyPatternId]
   ,[TransportModeCode]
   ,[ContractCode]
   ,[ContractorCode]
   ,[ContractorGarageCode]
   ,[PlannedStartDateTime]
   ,[PlannedEndDateTime]
   ,[PlannedStopCount]
   ,[PlannedPaidDurationSeconds]
   ,[PlannedPaidDistanceMeters]
   ,[DatedVehicleJourneyId]
   ,[DatedVehicleJourneyGid]
   ,[LineDirectionCode]
   ,[IsDeleted]
   ,[LastModifiedUtcDateTime]
   ,[Inserted]
   ,[Updated]
from
    [data].[RT_Journey_Future] (nolock));

GO

