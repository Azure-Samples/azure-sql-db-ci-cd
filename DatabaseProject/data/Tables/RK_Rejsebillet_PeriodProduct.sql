CREATE TABLE [data].[RK_Rejsebillet_PeriodProduct] (
    [SourceSystemCode]      NVARCHAR (15)   NOT NULL,
    [SourceSystemEntryRef]  NVARCHAR (60)   NOT NULL,
    [OrderEncryptedID]      NVARCHAR (32)   NULL,
    [AccountingEncryptedID] NVARCHAR (32)   NULL,
    [TicketEncryptedID]     NVARCHAR (32)   NULL,
    [SeasonPassID]          NVARCHAR (12)   NULL,
    [ProductCode]           NVARCHAR (8)    NULL,
    [ProductName]           NVARCHAR (40)   NULL,
    [SalesDT]               DATE            NULL,
    [AccountingDT]          DATE            NULL,
    [ZoneNrLow]             INT             NULL,
    [ZoneNrHigh]            INT             NULL,
    [SeasonPassZones]       INT             NULL,
    [ZonesPayed]            INT             NULL,
    [SeasonPassStatus]      INT             NULL,
    [PassengerGroupType1]   INT             NULL,
    [PsedoFareset]          NVARCHAR (18)   NULL,
    [SeasonPassCategory]    NVARCHAR (12)   NULL,
    [ValidityStartDT]       DATE            NULL,
    [ValidityEndDT]         DATE            NULL,
    [Model]                 NVARCHAR (4)    NULL,
    [DelingsRegel]          NVARCHAR (4)    NULL,
    [Price]                 NUMERIC (18, 2) NULL,
    [RevenueShare]          NUMERIC (18, 2) NULL,
    [RBindt_Arriva]         DECIMAL (18, 5) NULL,
    [RBindt_GoCollectiv]    DECIMAL (18, 5) NULL,
    [RBindt_NT]             DECIMAL (18, 5) NULL,
    [RBindt_Midttrafik]     DECIMAL (18, 5) NULL,
    [RBindt_2060]           DECIMAL (18, 5) NULL,
    [RBindt_MoviaS_]        DECIMAL (18, 5) NULL,
    [RBindt_MoviaH]         DECIMAL (18, 5) NULL,
    [RBindt_Sydtrafik]      DECIMAL (18, 5) NULL,
    [RBindt_Metro]          DECIMAL (18, 5) NULL,
    [RBindt_MoviaV]         DECIMAL (18, 5) NULL,
    [RBindt_Movia]          DECIMAL (18, 5) NULL,
    [RBindt_DSB]            DECIMAL (18, 5) NULL,
    [RBindt_STog]           DECIMAL (18, 5) NULL,
    [RBindt_Fynbus]         DECIMAL (18, 5) NULL,
    [Amount]                NUMERIC (18, 5) NULL,
    [ValidityDays]          INT             NULL,
    [EndDT]                 NVARCHAR (7)    NULL,
    [PTOOUT]                CHAR (15)       NULL,
    [OpgDT]                 DATE            NULL,
    [ZoneList]              NVARCHAR (MAX)  NULL,
    [PaymentReceivedFLG]    NVARCHAR (4)    NULL,
    [PaymentChangeDTTM]     DATETIME2 (0)   NULL,
    [MediaTypeCode]         NVARCHAR (5)    NULL,
    [SalesChannelCode]      NVARCHAR (15)   NULL,
    [Inserted]              DATETIME2 (0)   NULL,
    [Updated]               DATETIME2 (0)   NULL,
    [Hash]                  VARBINARY (32)  NULL,
    CONSTRAINT [PK_RK_Rejsebillet_PeriodProduct] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RK_Rejsebillet_PeriodProduct_SourceSystemEnteryRef]
    ON [data].[RK_Rejsebillet_PeriodProduct]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([OrderEncryptedID], [AccountingEncryptedID], [TicketEncryptedID]);


GO

