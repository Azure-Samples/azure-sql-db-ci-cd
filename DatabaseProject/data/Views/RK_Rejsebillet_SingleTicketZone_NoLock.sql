



CREATE view [data].[RK_Rejsebillet_SingleTicketZone_NoLock]
as(
SELECT  [TicketEncryptedID]
      ,[AccountingEncryptedID]
      ,[ZoneID]
      ,[DeliveryID]
      ,[DataDT]
      ,[SourceSystemCode]
      ,[MediaTypeCode]
      ,[SalesChannelCode]
      ,[Inserted]
      ,[Updated]
     
  FROM [data].[RK_Rejsebillet_SingleTicketZone]
 with (nolock));

GO

