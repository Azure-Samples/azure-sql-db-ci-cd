CREATE TABLE [stg_dim].[ACCT_Erp_Company] (
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] BIGINT         NULL,
    [IsCurrent]           BIT            NULL,
    [CompanyCode]         NVARCHAR (20)  NOT NULL,
    [CompanyName]         NVARCHAR (250) NOT NULL,
    [CompanyDisplayName]  NVARCHAR (250) NOT NULL,
    [ValidFromDate]       DATE           NULL,
    [ValidToDate]         DATE           NULL
);


GO

