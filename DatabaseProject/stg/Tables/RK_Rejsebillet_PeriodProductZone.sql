CREATE TABLE [stg].[RK_Rejsebillet_PeriodProductZone] (
    [SourceSystemCode]      NVARCHAR (11) NULL,
    [SourceSystemEntryRef]  NVARCHAR (74) NULL,
    [TicketEncryptedID]     NVARCHAR (32) NULL,
    [AccountingEncryptedID] NVARCHAR (32) NULL,
    [ZoneID]                NVARCHAR (4)  NULL,
    [MediaTypeCode]         NVARCHAR (3)  NULL,
    [SalesChannelCode]      NVARCHAR (11) NULL
);


GO

