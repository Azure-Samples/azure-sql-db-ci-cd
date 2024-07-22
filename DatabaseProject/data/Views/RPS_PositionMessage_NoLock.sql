create view data.[RPS_PositionMessage_NoLock]
as(
select
    [Id]
   ,[SendDateTime]
   ,[ReceivedDateTime]
   ,[Priority]
   ,[UnitIdentity]
   ,[SequenceNumber]
   ,[Timestamp]
   ,[Latitude]
   ,[Longitude]
   ,[Speed]
   ,[Direction]
   ,[GpsFixType]
   ,[GpsQuality]
   ,[InService]
   ,[StopRequested]
   ,[DoorReleased]
   ,[PowerOn]
   ,[Distance]
   ,[VehicleId]
   ,[ServiceJourneyId]
from
    [data].[RPS_PositionMessage] (nolock));

GO

