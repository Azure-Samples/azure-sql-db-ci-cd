
CREATE VIEW [data].[RK_Rejsebillet_PeriodProductZone_NoLock]
AS
(SELECT [SourceSystemCode]
      ,[SourceSystemEntryRef]
      ,[TicketEncryptedID]
      ,[AccountingEncryptedID]
      ,[ZoneID]
      ,[MediaTypeCode]
      ,[SalesChannelCode]
      ,[Inserted]
      ,[Updated]
      ,[Hash]
  FROM [data].[RK_Rejsebillet_PeriodProductZone]
   WITH (NOLOCK));

GO

