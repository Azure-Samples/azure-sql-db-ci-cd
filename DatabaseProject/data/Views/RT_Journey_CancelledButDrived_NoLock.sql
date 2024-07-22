
create view [data].[RT_Journey_CancelledButDrived_NoLock]
as(
select OperatingDayDate,
       LineDesignation,
       JourneyNumber,JourneyRef,
       ContractCode,
       ContractorCode,
       PlannedStartDateTime,
      PlannedEndDateTime,  
       ObservedStartDateTime,
       ObservedEndDateTime,
       HasCancellation=isnull(HasCancellation,0),
       ObservedDepartureCount=isnull(ObservedDepartureCount,0),
      EstimatedDepartureCount=isnull( EstimatedDepartureCount,0),
      TotalCheckInCount= isnull(TotalCheckInCount,0),
       TotalCheckOutCount= isnull(TotalCheckOutCount,0),
       PrimaryVehicleGid =    isnull(PrimaryVehicleGid,0)
from data.RT_Journey (nolock)
where OperatingDayDate > '2018-12-31'
     and HasCancellation=1
   and (ObservedDepartureCount<>0 or EstimatedDepartureCount<>0)
   );

GO

