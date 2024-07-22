CREATE TABLE [stg].[ACCT_Erp_Transaction] (
    [SourceSystemCode]                NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]            NVARCHAR (250)  NOT NULL,
    [CompanyCode]                     NVARCHAR (20)   NULL,
    [AccountNumber]                   NVARCHAR (250)  NULL,
    [Date]                            DATE            NULL,
    [Voucher]                         NVARCHAR (250)  NULL,
    [Text]                            NVARCHAR (250)  NULL,
    [Amount]                          NUMERIC (18, 2) NULL,
    [Type]                            INT             NULL,
    [SourceSystemGlobalDimension1Ref] NVARCHAR (250)  NULL,
    [SourceSystemGlobalDimension3Ref] NVARCHAR (250)  NULL,
    [OrganizationCode]                NVARCHAR (20)   NULL,
    [SourceSystemGlobalDimension2Ref] NVARCHAR (250)  NULL,
    [VatAmount]                       NUMERIC (18, 2) NULL,
    [VatGroupCode]                    NVARCHAR (20)   NULL,
    [SourceSystemGlobalDimension4Ref] NVARCHAR (250)  NULL,
    [SourceSystemGlobalDimension5Ref] NVARCHAR (250)  NULL,
    [SourceSystemGlobalDimension6Ref] NVARCHAR (250)  NULL,
    [TransactionNo]                   INT             NULL,
    [TransactionEntryNo]              INT             NULL,
    [PostingType]                     NVARCHAR (20)   NULL,
    [ErpRowVersion]                   VARBINARY (8)   NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_Erp_Transaction_Merge]
    ON [stg].[ACCT_Erp_Transaction]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([TransactionNo], [TransactionEntryNo], [AccountNumber], [Date], [SourceSystemGlobalDimension4Ref], [SourceSystemGlobalDimension5Ref], [SourceSystemGlobalDimension6Ref], [SourceSystemGlobalDimension3Ref], [OrganizationCode], [SourceSystemGlobalDimension2Ref], [VatAmount], [VatGroupCode], [CompanyCode], [Voucher], [PostingType], [Text], [Amount], [Type], [SourceSystemGlobalDimension1Ref]);


GO

