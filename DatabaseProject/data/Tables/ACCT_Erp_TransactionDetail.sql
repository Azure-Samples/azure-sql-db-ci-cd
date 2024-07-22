CREATE TABLE [data].[ACCT_Erp_TransactionDetail] (
    [SourceSystemCode]           NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]       NVARCHAR (250)  NOT NULL,
    [SourceSystemTransactionRef] NVARCHAR (250)  NOT NULL,
    [PostingDate]                DATE            NOT NULL,
    [SourceType]                 TINYINT         NULL,
    [DocumentNo]                 NVARCHAR (250)  NULL,
    [DocumentType]               TINYINT         NULL,
    [LineNo]                     INT             NOT NULL,
    [LineType]                   TINYINT         NULL,
    [AccountNo]                  NVARCHAR (250)  NOT NULL,
    [Description]                NVARCHAR (250)  NULL,
    [Quantity]                   NUMERIC (18, 2) NULL,
    [Amount]                     NUMERIC (18, 2) NOT NULL,
    [VatAmount]                  NUMERIC (18, 2) NOT NULL,
    [VatGroupCode]               NVARCHAR (20)   NULL,
    [ItemNo]                     NVARCHAR (20)   NULL,
    [BusinessPostingGroup]       NVARCHAR (20)   NULL,
    [ProductPostingGroup]        NVARCHAR (20)   NULL,
    [DocumentStatus]             TINYINT         NULL,
    [CustomerCode]               NVARCHAR (20)   NULL,
    [WebshopOrderNo]             NVARCHAR (250)  NULL,
    [PersonalCardStatus]         NVARCHAR (20)   NULL,
    [LocationCode]               NVARCHAR (20)   NULL,
    [Accrued]                    BIT             NULL,
    [WebShopOrderLineNo]         INT             NULL,
    [PostingType]                NVARCHAR (20)   NULL,
    [Inserted]                   DATETIME2 (0)   NULL,
    [Updated]                    DATETIME2 (0)   NULL,
    [Hash]                       VARBINARY (32)  NULL,
    CONSTRAINT [PK_ACCT_Erp_TransactionDetail] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_ACCT_Erp_TransactionDetail for ACCT_Erp_DotWebshop_SaleEnriched]
    ON [data].[ACCT_Erp_TransactionDetail]([PostingDate] ASC, [WebshopOrderNo] ASC)
    INCLUDE([SourceSystemTransactionRef], [Description], [Quantity], [Amount], [ItemNo], [ProductPostingGroup], [WebShopOrderLineNo]);


GO

CREATE NONCLUSTERED INDEX [IX_ACCT_Erp_TransactionDetail_SourceSystemCode_SourceSystemTransactionRef]
    ON [data].[ACCT_Erp_TransactionDetail]([SourceSystemCode] ASC, [SourceSystemTransactionRef] ASC)
    INCLUDE([CustomerCode], [Description], [ItemNo], [PostingDate], [PostingType], [SourceSystemEntryRef], [VatAmount], [VatGroupCode], [WebshopOrderNo]);


GO

CREATE COLUMNSTORE INDEX [CSIX_ACCT_Erp_TransactionDetail]
    ON [data].[ACCT_Erp_TransactionDetail]([PersonalCardStatus], [LocationCode], [SourceSystemCode], [DocumentType], [LineType], [Accrued], [AccountNo], [ItemNo], [CustomerCode], [WebshopOrderNo]);


GO

