CREATE TABLE [dim].[SALE_OperationalSale_Customer] (
    [CustomerKey]               INT               IDENTITY (1, 1) NOT NULL,
    [IsCurrent]                 BIT               NOT NULL,
    [SourceSystemCode]          NVARCHAR (20)     NOT NULL,
    [SourceSystemEntryRef]      NVARCHAR (250)    NULL,
    [CustomerCode]              NVARCHAR (20)     NOT NULL,
    [CustomerName]              NVARCHAR (250)    NOT NULL,
    [CustomerDisplayName]       NVARCHAR (250)    NULL,
    [CustomerDisplayIndex]      INT               NULL,
    [CustomerAttention]         NVARCHAR (250)    NULL,
    [CustomerAddress1]          NVARCHAR (250)    NULL,
    [CustomerAddress2]          NVARCHAR (250)    NULL,
    [CustomerPostalCode]        NVARCHAR (20)     NULL,
    [CustomerCity]              NVARCHAR (250)    NULL,
    [CustomerCountryCode]       NVARCHAR (20)     NULL,
    [CustomerCountryName]       NVARCHAR (250)    NULL,
    [CustomerPhone]             NVARCHAR (250)    NULL,
    [CustomerEmail]             NVARCHAR (250)    NULL,
    [CustomerGroupCode]         NVARCHAR (20)     NULL,
    [CustomerGroupDisplayIndex] INT               NULL,
    [CustomerLatitude]          DECIMAL (18, 12)  NULL,
    [CustomerLongitude]         DECIMAL (18, 12)  NULL,
    [CustomerGeography]         [sys].[geography] NULL,
    [ValidFromDate]             DATE              NULL,
    [ValidToDate]               DATE              NULL,
    [MunicipalityCode]          NVARCHAR (20)     NULL,
    [MunicipalityName]          NVARCHAR (250)    NULL,
    [MunicipalityDisplayName]   NVARCHAR (250)    NULL,
    [MunicipalityDisplayIndex]  INT               NULL,
    [Inserted]                  DATETIME2 (0)     NULL,
    [Updated]                   DATETIME2 (0)     NULL,
    [Hash]                      VARBINARY (32)    NULL,
    CONSTRAINT [PK_SALE_OperationalSale_Customer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [SALE_OperationalSale_Customer_Merge]
    ON [dim].[SALE_OperationalSale_Customer]([SourceSystemCode] ASC, [CustomerCode] ASC)
    INCLUDE([CustomerKey], [IsCurrent], [SourceSystemEntryRef], [CustomerName], [CustomerDisplayName], [CustomerDisplayIndex], [CustomerAttention], [CustomerAddress1], [CustomerAddress2], [CustomerPostalCode], [CustomerCity], [CustomerCountryCode], [CustomerCountryName], [CustomerPhone], [CustomerEmail], [CustomerGroupCode], [CustomerGroupDisplayIndex], [CustomerLatitude], [CustomerLongitude], [CustomerGeography], [ValidFromDate], [ValidToDate], [MunicipalityCode], [MunicipalityName], [MunicipalityDisplayName], [MunicipalityDisplayIndex]);


GO

