CREATE TABLE [stg_dim].[ACCT_Erp_Item] (
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (250) NULL,
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
    [IsCurrent]               BIT            NULL
);


GO

