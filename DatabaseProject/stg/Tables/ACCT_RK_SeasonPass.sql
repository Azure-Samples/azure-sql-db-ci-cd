CREATE TABLE [stg].[ACCT_RK_SeasonPass] (
    [EncryptedCardEngravedID] NVARCHAR (60)   NOT NULL,
    [SeasonPassID]            INT             NOT NULL,
    [TransactionID]           BIGINT          NOT NULL,
    [ProductCode]             INT             NOT NULL,
    [ProductName]             NVARCHAR (40)   NOT NULL,
    [CardType]                NVARCHAR (20)   NOT NULL,
    [NumberOfPeriods]         INT             NOT NULL,
    [ServiceSurcharge]        NUMERIC (18, 2) NOT NULL,
    [MetroSupplementPart]     NUMERIC (18, 2) NOT NULL,
    [SalesDT]                 DATETIME2 (0)   NOT NULL,
    [PsedoFareset]            NVARCHAR (20)   NOT NULL,
    [SeasonPassCategory]      NVARCHAR (16)   NOT NULL,
    [ValidityStartDT]         DATETIME2 (0)   NOT NULL,
    [ValidityEndDT]           DATETIME2 (0)   NOT NULL,
    [ZoneNrLow]               INT             NOT NULL,
    [ZoneNrHigh]              INT             NOT NULL,
    [PassengerGroupType1]     NVARCHAR (20)   NOT NULL,
    [PriceSurCharge]          NUMERIC (18, 2) NULL,
    [Price]                   NUMERIC (18, 2) NOT NULL,
    [PaidZones]               SMALLINT        NULL,
    [ValidityZones]           SMALLINT        NULL,
    [PriceDay]                NUMERIC (18, 2) NULL,
    [PriceChildDay]           NUMERIC (18, 2) NULL,
    [ProcessedDT_str]         NVARCHAR (20)   NULL,
    [ProcessedDT]             DATETIME2 (0)   NULL,
    [PaidZones_Cal]           SMALLINT        NULL,
    [NumberOfPeriods_Cal]     INT             NULL,
    [AccountingDT]            DATETIME2 (0)   NULL,
    [ValidityStartDT_Cal]     DATETIME2 (0)   NULL,
    [ValidityEndDT_Cal]       DATETIME2 (0)   NULL,
    [ZoneList]                NVARCHAR (1024) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RK_SeasonPass_Merge]
    ON [stg].[ACCT_RK_SeasonPass]([EncryptedCardEngravedID] ASC, [SeasonPassID] ASC, [TransactionID] ASC)
    INCLUDE([CardType], [MetroSupplementPart], [NumberOfPeriods], [PassengerGroupType1], [Price], [PriceSurCharge], [ProductCode], [ProductName], [PsedoFareset], [SalesDT], [SeasonPassCategory], [ServiceSurcharge], [ValidityEndDT], [ValidityStartDT], [ZoneNrHigh], [ZoneNrLow]);


GO

