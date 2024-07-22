

create view [data].[RT_Journey_NonObserved_NoLock]
as(
select OperatingDayDate,
       LineDesignation,
       JourneyNumber,
       ContractCode,
       ContractorCode,
       PlannedStartDateTime,
       PlannedEndDateTime,
       ObservedStartDateTime,
       ObservedEndDateTime,
       HasCancellation,
       ObservedDepartureCount,
       EstimatedDepartureCount,
       TotalCheckInCount,
       TotalCheckOutCount,
       PrimaryVehicleGid
from data.RT_Journey (nolock)
where OperatingDayDate > '2018-12-31'
      and ObservedDepartureCount = 0
      and EstimatedDepartureCount = 0
      and
      (
          TotalCheckInCount = 0
          or TotalCheckInCount is null
      )
      and
      (
          TotalCheckOutCount = 0
          or TotalCheckOutCount is null
      )
      --   AND ObservedStartDateTime IS NULL
      -- AND ObservedEndDateTime IS NULL
      --   AND PrimaryDeviceId IS NULL
      --  AND TrackingSourceSystemCode IS NULL
      and PrimaryVehicleGid is null
      and HasCancellation <> 1);

GO

