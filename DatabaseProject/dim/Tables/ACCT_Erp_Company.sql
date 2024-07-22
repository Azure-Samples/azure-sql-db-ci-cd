CREATE TABLE [dim].[ACCT_Erp_Company] (
    [CompanyKey]           INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]     INT            NOT NULL,
    [ValidToDateKey]       INT            NOT NULL,
    [IsCurrent]            BIT            NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]  BIGINT         NULL,
    [CompanyCode]          NVARCHAR (20)  NOT NULL,
    [CompanyName]          NVARCHAR (250) NOT NULL,
    [CompanyDisplayName]   NVARCHAR (250) NOT NULL,
    [GlobalDimension1Code] NVARCHAR (20)  NULL,
    [GlobalDimension1Name] NVARCHAR (250) NULL,
    [GlobalDimension2Code] NVARCHAR (20)  NULL,
    [GlobalDimension2Name] NVARCHAR (250) NULL,
    [GlobalDimension3Code] NVARCHAR (20)  NULL,
    [GlobalDimension3Name] NVARCHAR (250) NULL,
    [GlobalDimension4Code] NVARCHAR (20)  NULL,
    [GlobalDimension4Name] NVARCHAR (250) NULL,
    [GlobalDimension5Code] NVARCHAR (20)  NULL,
    [GlobalDimension5Name] NVARCHAR (250) NULL,
    [GlobalDimension6Code] NVARCHAR (20)  NULL,
    [GlobalDimension6Name] NVARCHAR (250) NULL,
    CONSTRAINT [PK_ACCT_Erp_Company] PRIMARY KEY CLUSTERED ([CompanyKey] ASC),
    CONSTRAINT [BK_ACCT_Erp_Company] UNIQUE NONCLUSTERED ([CompanyCode] ASC, [ValidFromDateKey] ASC)
);


GO

