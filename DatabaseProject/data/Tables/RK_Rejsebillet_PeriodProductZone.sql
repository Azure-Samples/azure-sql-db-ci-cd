CREATE TABLE [data].[RK_Rejsebillet_PeriodProductZone] (
    [SourceSystemCode]      NVARCHAR (15)  NOT NULL,
    [SourceSystemEntryRef]  NVARCHAR (74)  NOT NULL,
    [TicketEncryptedID]     NVARCHAR (50)  NOT NULL,
    [AccountingEncryptedID] NVARCHAR (50)  NOT NULL,
    [ZoneID]                NVARCHAR (10)  NOT NULL,
    [MediaTypeCode]         NVARCHAR (5)   NULL,
    [SalesChannelCode]      NVARCHAR (15)  NULL,
    [Inserted]              DATETIME2 (0)  NULL,
    [Updated]               DATETIME2 (0)  NULL,
    [Hash]                  VARBINARY (32) NULL,
    CONSTRAINT [PK_RK_Rejsebillet_PeriodProductZone] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RK_Rejsebillet_PeriodProductZone_SourceSystemEnteryRef]
    ON [data].[RK_Rejsebillet_PeriodProductZone]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([TicketEncryptedID], [AccountingEncryptedID], [ZoneID]);


GO

