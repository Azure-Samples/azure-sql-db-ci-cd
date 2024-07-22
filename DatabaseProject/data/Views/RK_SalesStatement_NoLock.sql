


CREATE view [data].[RK_SalesStatement_NoLock]
as
select
       [Id]
      ,[FileId]
      ,[Inserted]
      ,[Updated]
      ,[ServiceProviderID]
      ,[ContractorID]
      ,[FareReferencePointID]
      ,[StopReferencePointID]
      ,[DeviceID]
      ,[VehicleID]
      ,[StaffID]
      ,[StaffName]
      ,[ShiftNumber]
      ,[ShiftStartDateTime]
      ,[ShiftEndDateTime]
      ,[Period]
      ,[Consistent]
      ,[QuantitySales]
      ,[QuantityCashTicket]
      ,[QuantityCancellationOfLastCashTicket]
      ,[AmountSales]
      ,[AmountCashTicket]
      ,[AmountCancellationOfLastCashTicket]
      ,[AmountTill]
      ,[CashTicketCancelled]
from
    [data].[RK_SalesStatement] with (nolock)
;

GO

