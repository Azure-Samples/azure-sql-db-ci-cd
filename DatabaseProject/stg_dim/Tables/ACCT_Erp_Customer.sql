CREATE TABLE [stg_dim].[ACCT_Erp_Customer] (
    [SourceSystemCode]    NVARCHAR (20)     NOT NULL,
    [SourceSystemEntryId] NVARCHAR (250)    NOT NULL,
    [CustomerCode]        NVARCHAR (20)     NULL,
    [CustomerName]        NVARCHAR (250)    NULL,
    [CustomerAddress1]    NVARCHAR (250)    NULL,
    [CustomerAddress2]    NVARCHAR (250)    NULL,
    [CustomerPostalCode]  NVARCHAR (20)     NULL,
    [CustomerCity]        NVARCHAR (250)    NULL,
    [CustomerCountryCode] NVARCHAR (20)     NULL,
    [CustomerCountryName] NVARCHAR (250)    NULL,
    [CustomerPhone]       NVARCHAR (250)    NULL,
    [CustomerEmail]       NVARCHAR (250)    NULL,
    [CustomerAttention]   NVARCHAR (250)    NULL,
    [CustomerGroupCode]   NVARCHAR (20)     NULL,
    [CustomerLatitude]    FLOAT (53)        NULL,
    [CustomerLongitude]   FLOAT (53)        NULL,
    [CustomerGeography]   [sys].[geography] NULL,
    [MunicipalityCode]    NVARCHAR (20)     NULL,
    [ValidFromDate]       DATE              NULL,
    [ValidToDate]         DATE              NULL,
    [IsCurrent]           BIT               NULL
);


GO

