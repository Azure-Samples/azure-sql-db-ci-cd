CREATE TABLE [integration].[SALE_OperationalSale_AmountTypeBridge] (
    [SourceSystemCode]     NVARCHAR (255) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (255) NOT NULL,
    [AmountTypeName]       NVARCHAR (255) NOT NULL,
    [SourceSystemTable]    NVARCHAR (255) NOT NULL,
    [SourceSystemColumn]   NVARCHAR (255) NOT NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    CONSTRAINT [PK_AmountTypeBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

