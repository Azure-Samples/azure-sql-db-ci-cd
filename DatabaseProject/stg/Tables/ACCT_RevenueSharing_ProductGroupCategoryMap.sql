CREATE TABLE [stg].[ACCT_RevenueSharing_ProductGroupCategoryMap] (
    [SourceSystemEntryRef]     NVARCHAR (400)  NULL,
    [SourceSystemProductRef]   NVARCHAR (255)  NULL,
    [SourceSystemCode]         NVARCHAR (50)   NULL,
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
    [SalesCompany]             NVARCHAR (255)  NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_RevenueSharing_ProductGroupCategoryMap_Merge]
    ON [stg].[ACCT_RevenueSharing_ProductGroupCategoryMap]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([SourceSystemProductRef], [ItemDescription], [SourceSystem], [RevenueGroup], [DelieveryMedia], [NumberOfPaidFareZones], [PriceParameterFile], [ItemGroupName], [DOT_SalesChannelName], [ValidityDaysPerUnit], [ValidFromDate], [ValidToDate], [PricePerDay], [ItemName], [DOT_SalesChannelCategory], [CustomerType], [DOT_DeliveryMedia]);


GO

