CREATE TABLE [stg_dim].[SALE_OperationalSale_AmountType] (
    [IsCurrent]              BIT            NULL,
    [SourceSystemCode]       NVARCHAR (20)  NOT NULL,
    [AmountTypeCode]         NVARCHAR (20)  NULL,
    [AmountTypeName]         NVARCHAR (250) NULL,
    [AmountTypeDisplayName]  NVARCHAR (250) NULL,
    [ValidFromDate]          DATE           NULL,
    [ValidToDate]            DATE           NULL,
    [SourceSystemEntryRef]   NVARCHAR (20)  NULL,
    [AmountTypeDisplayIndex] INT            NULL
);


GO

