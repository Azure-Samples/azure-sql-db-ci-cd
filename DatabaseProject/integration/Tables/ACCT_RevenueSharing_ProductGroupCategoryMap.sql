CREATE TABLE [integration].[ACCT_RevenueSharing_ProductGroupCategoryMap] (
    [SourceSystemEntryRef]     NVARCHAR (400)  NOT NULL,
    [SourceSystemProductRef]   NVARCHAR (255)  NULL,
    [SourceSystemCode]         NVARCHAR (50)   NOT NULL,
    [ItemDescription]          NVARCHAR (255)  NULL,
    [SourceSystem]             NVARCHAR (255)  NULL,
    [RevenueGroup]             NVARCHAR (255)  NULL,
    [ItemGroupName]            NVARCHAR (255)  NULL,
    [ItemName]                 NVARCHAR (255)  NULL,
    [ValidityDaysPerUnit]      DECIMAL (18, 2) NULL,
    [CustomerType]             NVARCHAR (255)  NULL,
    [DelieveryMedia]           NVARCHAR (255)  NULL,
    [NumberOfPaidFareZones]    DECIMAL (18)    NULL,
    [PriceParameterFile]       NVARCHAR (255)  NULL,
    [DOT_SalesChannelCategory] NVARCHAR (255)  NULL,
    [DOT_SalesChannelName]     NVARCHAR (255)  NULL,
    [DOT_DeliveryMedia]        NVARCHAR (255)  NULL,
    [ValidFromDate]            DATE            NULL,
    [ValidToDate]              DATE            NULL,
    [PricePerDay]              NVARCHAR (255)  NULL,
    [Inserted]                 DATETIME2 (0)   NULL,
    [Updated]                  DATETIME2 (0)   NULL,
    [Hash]                     BINARY (50)     NULL,
    [SalesCompany]             NVARCHAR (255)  NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_ProductGroupCategoryMap_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_RevenueSharing_ProductGroupCategoryMap_Merge]
    ON [integration].[ACCT_RevenueSharing_ProductGroupCategoryMap]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([Hash]);


GO

