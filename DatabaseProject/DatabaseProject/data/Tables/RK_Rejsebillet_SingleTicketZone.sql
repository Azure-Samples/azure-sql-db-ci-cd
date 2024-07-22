CREATE TABLE [data].[RK_Rejsebillet_SingleTicketZone] (
    [TicketEncryptedID]     NVARCHAR (50)  NOT NULL,
    [AccountingEncryptedID] NVARCHAR (50)  NOT NULL,
    [ZoneID]                NVARCHAR (10)  NOT NULL,
    [DeliveryID]            NVARCHAR (10)  NULL,
    [DataDT]                NVARCHAR (10)  NULL,
    [SourceSystemCode]      NVARCHAR (15)  NULL,
    [MediaTypeCode]         NVARCHAR (5)   NULL,
    [SalesChannelCode]      NVARCHAR (15)  NULL,
    [Inserted]              DATETIME2 (0)  NULL,
    [Updated]               DATETIME2 (0)  NULL,
    [Hash]                  VARBINARY (32) NULL,
    CONSTRAINT [PK_RK_Rejsebillet_SingleTicketZone] PRIMARY KEY CLUSTERED ([TicketEncryptedID] ASC, [AccountingEncryptedID] ASC, [ZoneID] ASC)
);


GO

