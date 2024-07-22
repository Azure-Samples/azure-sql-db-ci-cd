CREATE TABLE [stg].[ACCT_Erp_TransactionDetail] (
    [SourceSystemCode]           NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]       NVARCHAR (250)  NOT NULL,
    [PostingDate]                DATE            NOT NULL,
    [DocumentNo]                 NVARCHAR (250)  NULL,
    [LineNo]                     INT             NOT NULL,
    [AccountNo]                  NVARCHAR (250)  NOT NULL,
    [Description]                NVARCHAR (250)  NULL,
    [Amount]                     NUMERIC (18, 2) NOT NULL,
    [VatAmount]                  NUMERIC (18, 2) NOT NULL,
    [VatGroupCode]               NVARCHAR (20)   NULL,
    [SourceSystemTransactionRef] NVARCHAR (250)  NOT NULL,
    [SourceType]                 TINYINT         NULL,
    [DocumentType]               TINYINT         NULL,
    [LineType]                   TINYINT         NULL,
    [Quantity]                   NUMERIC (18, 2) NULL,
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
    [ErpRowVersion]              VARBINARY (8)   NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_Erp_TransactionDetail_Merge]
    ON [stg].[ACCT_Erp_TransactionDetail]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([AccountNo], [Accrued], [Amount], [BusinessPostingGroup], [CustomerCode], [Description], [DocumentNo], [DocumentStatus], [DocumentType], [ItemNo], [LineNo], [LineType], [LocationCode], [PersonalCardStatus], [PostingDate], [PostingType], [ProductPostingGroup], [Quantity], [SourceSystemTransactionRef], [SourceType], [VatAmount], [VatGroupCode], [WebShopOrderLineNo], [WebshopOrderNo]);


GO

