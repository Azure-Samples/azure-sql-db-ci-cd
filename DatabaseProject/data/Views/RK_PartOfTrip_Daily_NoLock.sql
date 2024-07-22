

CREATE view [data].[RK_PartOfTrip_Daily_NoLock]
as
select
    pot.TripRef
   ,pot.TripDate
   ,pot.MsgReportDate
   ,pot.CardTransactionSequenceNumber
   ,pot.TransactionType
   ,pot.ServiceProviderID
   ,pot.ContractorID
   ,pot.DeviceID
   ,pot.DeviceIDHex
   ,pot.PartialTripFromStopPointID
   ,pot.PartialTripFromStopPointName
   ,pot.PartialTripToStopPointID
   ,pot.PartialTripToStopPointName
   ,[RouteID] = (pot.RouteID & 0xFFF)
   ,l.LineDesignation
   ,pot.StartStopPointID
   ,pot.EndStopPointID
   ,pot.TripType
   ,pot.VehicleID
   ,pot.JourneyRef
   ,pot.FromJourneyPointRef
   ,pot.ToJourneyPointRef
from
    data.RK_PartOfTrip_Daily pot with (nolock)
    left join dim.Line l on
        pot.ServiceProviderID = 2006
        and l.LineNumber = pot.RouteID & 0xFFF
        and l.IsCurrent = 1
;

GO

