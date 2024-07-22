CREATE TABLE [stg].[RK_Rejsebillet_SingleTicketZone] (
    [TicketEncryptedID]     NVARCHAR (50) NULL,
    [AccountingEncryptedID] NVARCHAR (50) NULL,
    [ZoneID]                NVARCHAR (10) NULL,
    [DeliveryID]            NVARCHAR (10) NULL,
    [DataDT]                NVARCHAR (10) NULL,
    [SourceSystemCode]      NVARCHAR (15) NULL,
    [MediaTypeCode]         NVARCHAR (5)  NULL,
    [SalesChannelCode]      NVARCHAR (15) NULL
);


GO

