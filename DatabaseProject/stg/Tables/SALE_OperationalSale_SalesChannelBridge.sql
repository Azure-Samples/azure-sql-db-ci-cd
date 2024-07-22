CREATE TABLE [stg].[SALE_OperationalSale_SalesChannelBridge] (
    [SourceSystemCode]           NVARCHAR (255) NULL,
    [SalesChannelBridgeRef]      NVARCHAR (255) NULL,
    [SalesChannelCode]           NVARCHAR (255) NULL,
    [SalesChannelCodeHint]       NVARCHAR (255) NULL,
    [ItemNameFromDim]            NVARCHAR (255) NULL,
    [NeedsAttention]             NVARCHAR (255) NULL,
    [Acceptance]                 NVARCHAR (255) NULL,
    [ItemNo]                     NVARCHAR (20)  NULL,
    [SalesChannelCodeSuggestion] NVARCHAR (255) NULL
);


GO

