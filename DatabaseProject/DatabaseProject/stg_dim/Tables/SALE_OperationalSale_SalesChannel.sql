CREATE TABLE [stg_dim].[SALE_OperationalSale_SalesChannel] (
    [SourceSystemCode]            NVARCHAR (255) NULL,
    [SalesChannelCode]            VARCHAR (255)  NULL,
    [SalesChannelName]            VARCHAR (255)  NULL,
    [SalesChannelGroupName]       VARCHAR (255)  NULL,
    [SalesChannelResponsibleName] VARCHAR (255)  NULL,
    [IsVisible]                   NVARCHAR (255) NULL,
    [ValidFromDate]               DATE           NULL,
    [ValidToDate]                 DATE           NULL,
    [SalesChannelKey]             INT            NULL,
    [IsCurrent]                   BIT            NULL
);


GO

