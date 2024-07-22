CREATE TABLE [data].[ACCT_Erp_Transaction] (
    [SourceSystemCode]                NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]            NVARCHAR (250)  NOT NULL,
    [AccountNumber]                   NVARCHAR (250)  NOT NULL,
    [Date]                            DATE            NOT NULL,
    [Voucher]                         NVARCHAR (250)  NULL,
    [Text]                            NVARCHAR (250)  NULL,
    [Amount]                          NUMERIC (18, 2) NOT NULL,
    [Type]                            INT             NULL,
    [SourceSystemGlobalDimension1Ref] NVARCHAR (250)  NULL,
    [SourceSystemGlobalDimension2Ref] NVARCHAR (250)  NULL,
    [OrganizationCode]                NVARCHAR (20)   NULL,
    [SourceSystemGlobalDimension3Ref] NVARCHAR (250)  NULL,
    [VatAmount]                       NUMERIC (18, 2) NULL,
    [VatGroupCode]                    NVARCHAR (20)   NULL,
    [CompanyCode]                     NVARCHAR (20)   NULL,
    [SourceSystemGlobalDimension4Ref] NVARCHAR (250)  NULL,
    [SourceSystemGlobalDimension5Ref] NVARCHAR (250)  NULL,
    [SourceSystemGlobalDimension6Ref] NVARCHAR (250)  NULL,
    [PostingType]                     NVARCHAR (20)   NULL,
    [Inserted]                        DATETIME2 (0)   NULL,
    [Updated]                         DATETIME2 (0)   NULL,
    [Hash]                            VARBINARY (32)  NULL,
    CONSTRAINT [PK_ACCT_Erp_Transaction] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_ACCT_Erp_Transaction for ACCT_Erp_DotWebshop_SaleEnriched]
    ON [data].[ACCT_Erp_Transaction]([SourceSystemEntryRef] ASC)
    INCLUDE([AccountNumber], [Voucher], [Text], [Type], [SourceSystemGlobalDimension1Ref], [SourceSystemGlobalDimension2Ref]);


GO

CREATE COLUMNSTORE INDEX [CSIX_ACCT_Erp_Transaction]
    ON [data].[ACCT_Erp_Transaction]([SourceSystemCode], [Type], [OrganizationCode], [CompanyCode], [SourceSystemGlobalDimension4Ref]);


GO

