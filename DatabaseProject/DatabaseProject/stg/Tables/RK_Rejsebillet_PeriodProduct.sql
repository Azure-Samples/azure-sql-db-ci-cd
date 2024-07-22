CREATE TABLE [stg].[RK_Rejsebillet_PeriodProduct] (
    [OrderEncryptedID]      NVARCHAR (32)   NULL,
    [AccountingEncryptedID] NVARCHAR (32)   NULL,
    [TicketEncryptedID]     NVARCHAR (32)   NULL,
    [SourceSystemEntryRef]  NVARCHAR (60)   NULL,
    [SeasonPassID]          NVARCHAR (12)   NULL,
    [ProductCode]           NVARCHAR (8)    NULL,
    [ProductName]           NVARCHAR (40)   NULL,
    [SalesDT]               DATE            NULL,
    [SalesDT_]              NVARCHAR (10)   NULL,
    [AccountingDT]          DATE            NULL,
    [AccountingDT_]         NVARCHAR (10)   NULL,
    [ZoneNrLow]             INT             NULL,
    [ZoneNrLow_]            NVARCHAR (10)   NULL,
    [ZoneNrHigh]            INT             NULL,
    [ZoneNrHigh_]           NVARCHAR (10)   NULL,
    [SeasonPassZones]       INT             NULL,
    [ZonesPayed]            INT             NULL,
    [SeasonPassStatus]      INT             NULL,
    [PassengerGroupType1]   INT             NULL,
    [PsedoFareset]          NVARCHAR (18)   NULL,
    [SeasonPassCategory]    NVARCHAR (12)   NULL,
    [ValidityStartDT]       DATE            NULL,
    [ValidityStartDT_]      NVARCHAR (50)   NULL,
    [ValidityEndDT]         DATE            NULL,
    [ValidityEndDT_]        NVARCHAR (50)   NULL,
    [Model]                 NVARCHAR (4)    NULL,
    [DelingsRegel]          NVARCHAR (4)    NULL,
    [Price]                 NUMERIC (18, 2) NULL,
    [Price_]                NVARCHAR (20)   NULL,
    [RevenueShare]          NUMERIC (18, 2) NULL,
    [RevenueShare_]         NVARCHAR (20)   NULL,
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
    [Amount]                DECIMAL (18, 5) NULL,
    [Amount_]               NVARCHAR (50)   NULL,
    [ValidityDays]          INT             NULL,
    [EndDT]                 NVARCHAR (7)    NULL,
    [PTOOUT]                CHAR (15)       NULL,
    [OpgDT]                 DATE            NULL,
    [OpgDT_]                NVARCHAR (50)   NULL,
    [ZoneList]              NVARCHAR (MAX)  NULL,
    [PaymentReceivedFLG]    NVARCHAR (4)    NULL,
    [PaymentChangeDTTM]     DATETIME2 (0)   NULL,
    [PaymentChangeDTTM_]    NVARCHAR (50)   NULL,
    [SourceSystemCode]      NVARCHAR (15)   NULL,
    [MediaTypeCode]         NVARCHAR (5)    NULL,
    [SalesChannelCode]      NVARCHAR (15)   NULL
);


GO

