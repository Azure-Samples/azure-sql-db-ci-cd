CREATE TABLE [dim].[ACCT_Erp_Item] (
    [ItemKey]                 INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (250) NOT NULL,
    [ItemNo]                  NVARCHAR (20)  NULL,
    [ItemDescription]         NVARCHAR (250) NULL,
    [UnitCode]                NVARCHAR (20)  NULL,
    [ProductPostingGroupCode] NVARCHAR (20)  NULL,
    [VatPostingGroupCode]     NVARCHAR (20)  NULL,
    [ItemDisplayIndex]        INT            NULL,
    [WebShopItem]             BIT            NULL,
    [PersonalPeriodCard]      BIT            NULL,
    [ValidFromDate]           DATE           NULL,
    [ValidToDate]             DATE           NULL,
    [IsCurrent]               BIT            NULL,
    [Inserted]                DATETIME2 (0)  NULL,
    [Updated]                 DATETIME2 (0)  NULL,
    [Hash]                    VARBINARY (32) NULL,
    CONSTRAINT [PK_ACCT_Erp_Item] PRIMARY KEY CLUSTERED ([ItemKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_Erp_Item_Merge]
    ON [dim].[ACCT_Erp_Item]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([ItemKey], [ItemNo], [ItemDescription], [UnitCode], [PersonalPeriodCard], [IsCurrent], [ProductPostingGroupCode], [VatPostingGroupCode], [ValidFromDate], [ValidToDate], [ItemDisplayIndex], [WebShopItem]);


GO

