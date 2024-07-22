CREATE TABLE [dim].[SALE_OperationalSale_AmountType] (
    [AmountTypeKey]          INT            IDENTITY (1, 1) NOT NULL,
    [IsCurrent]              BIT            NOT NULL,
    [SourceSystemCode]       NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]   NVARCHAR (20)  NOT NULL,
    [AmountTypeCode]         NVARCHAR (20)  NOT NULL,
    [AmountTypeName]         NVARCHAR (250) NULL,
    [AmountTypeDisplayName]  NVARCHAR (250) NULL,
    [AmountTypeDisplayIndex] INT            NULL,
    [ValidFromDate]          DATE           NOT NULL,
    [ValidToDate]            DATE           NOT NULL,
    [Inserted]               DATETIME2 (0)  NOT NULL,
    [Updated]                DATETIME2 (0)  NULL,
    [Hash]                   VARBINARY (32) NULL,
    CONSTRAINT [PK_AmountType] PRIMARY KEY CLUSTERED ([AmountTypeKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [SALE_OperationalSale_AmountType_Merge]
    ON [dim].[SALE_OperationalSale_AmountType]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([AmountTypeKey], [IsCurrent], [AmountTypeCode], [AmountTypeName], [AmountTypeDisplayName], [AmountTypeDisplayIndex], [ValidFromDate], [ValidToDate]);


GO

