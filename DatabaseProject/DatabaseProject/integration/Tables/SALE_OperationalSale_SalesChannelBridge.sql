CREATE TABLE [integration].[SALE_OperationalSale_SalesChannelBridge] (
    [SourceSystemCode]           NVARCHAR (20)  NOT NULL,
    [SalesChannelBridgeRef]      NVARCHAR (140) NOT NULL,
    [SalesChannelCode]           NVARCHAR (20)  NULL,
    [ItemNameFromDim]            NVARCHAR (250) NULL,
    [NeedsAttention]             NVARCHAR (3)   NULL,
    [Acceptance]                 NVARCHAR (3)   NULL,
    [SalesChannelCodeSuggestion] NVARCHAR (20)  NULL,
    [SalesChannelCodeHint]       NVARCHAR (100) NULL,
    [Inserted]                   DATETIME2 (0)  NULL,
    [Updated]                    DATETIME2 (0)  NULL,
    [Hash]                       VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_OperationalSale_SalesChannelBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SalesChannelBridgeRef] ASC)
);


GO

