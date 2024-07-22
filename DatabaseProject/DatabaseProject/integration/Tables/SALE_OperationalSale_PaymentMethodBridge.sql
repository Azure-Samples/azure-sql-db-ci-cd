CREATE TABLE [integration].[SALE_OperationalSale_PaymentMethodBridge] (
    [SourceSystemCode]       NVARCHAR (30)  NOT NULL,
    [SourceSystemEntryRef]   NVARCHAR (255) NOT NULL,
    [PaymentMethodName]      NVARCHAR (255) NOT NULL,
    [PaymentMethodGroupName] NVARCHAR (255) NOT NULL,
    [SourceSystemTable]      NVARCHAR (255) NOT NULL,
    [SourceSystemColumn]     NVARCHAR (255) NOT NULL,
    [Inserted]               DATETIME2 (0)  NULL,
    CONSTRAINT [PK_SALE_OperationalSale_PaymentMethodBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

