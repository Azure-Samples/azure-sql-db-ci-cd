CREATE TABLE [integration].[SALE_OperationalSale_ItemBridge] (
    [SourceSystemCode]       NVARCHAR (30)  NOT NULL,
    [ItemBridgeRef]          NVARCHAR (50)  NOT NULL,
    [ItemNo]                 NVARCHAR (20)  NULL,
    [ItemName]               NVARCHAR (250) NULL,
    [ItemGroupCode]          NVARCHAR (250) NULL,
    [PassengerTypeName]      NVARCHAR (250) NULL,
    [TariffZoneQuantityName] NVARCHAR (250) NULL,
    [TariffValidityName]     NVARCHAR (250) NULL,
    [AmountTypeCode]         NVARCHAR (20)  NULL,
    [AmountTypeName]         NVARCHAR (50)  NULL,
    [NeedsAttention]         NVARCHAR (3)   NULL,
    [Acceptance]             NVARCHAR (3)   NULL,
    [Inserted]               DATETIME2 (0)  NULL,
    [Updated]                DATETIME2 (0)  NULL,
    [Hash]                   VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_OperationalSale_ItemBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [ItemBridgeRef] ASC)
);


GO

