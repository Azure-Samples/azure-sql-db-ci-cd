CREATE TABLE [stg_fact].[SALE_OperationalSale_TurnoverAgg] (
    [Id]                    INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]      NVARCHAR (20)   NOT NULL,
    [DateKey]               INT             NULL,
    [CustomerKey]           INT             NULL,
    [ItemKey]               INT             NULL,
    [SalesChannelKey]       INT             NULL,
    [AmountTypeKey]         INT             NULL,
    [PaymentMethodKey]      INT             NULL,
    [Amount]                NUMERIC (18, 2) NULL,
    [Quantity]              NUMERIC (18, 2) NULL,
    [PostingDate]           DATE            NULL,
    [CustomerRef]           NVARCHAR (50)   NULL,
    [ItemBridgeRef]         NVARCHAR (250)  NULL,
    [SalesChannelBridgeRef] NVARCHAR (250)  NULL,
    [AmountTypeRef]         NVARCHAR (20)   NULL,
    [PaymentMethodRef]      NVARCHAR (20)   NULL
);


GO

