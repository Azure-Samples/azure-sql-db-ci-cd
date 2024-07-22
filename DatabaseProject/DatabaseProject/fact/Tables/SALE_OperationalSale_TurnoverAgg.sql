CREATE TABLE [fact].[SALE_OperationalSale_TurnoverAgg] (
    [SourceSystemCode] NVARCHAR (20)   NOT NULL,
    [DateKey]          INT             NOT NULL,
    [CustomerKey]      INT             NOT NULL,
    [ItemKey]          INT             NOT NULL,
    [SalesChannelKey]  INT             NOT NULL,
    [AmountTypeKey]    INT             NOT NULL,
    [PaymentMethodKey] INT             NOT NULL,
    [Amount]           NUMERIC (18, 2) NOT NULL,
    [Quantity]         NUMERIC (18, 2) NULL,
    [Inserted]         DATETIME2 (0)   NULL,
    [Updated]          DATETIME2 (0)   NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_SALE_OperationalSale_TurnoverAgg_Merge]
    ON [fact].[SALE_OperationalSale_TurnoverAgg]([SourceSystemCode] ASC, [DateKey] ASC, [CustomerKey] ASC, [ItemKey] ASC, [SalesChannelKey] ASC, [AmountTypeKey] ASC, [PaymentMethodKey] ASC);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_SALE_OperationalSale_TurnoverAgg]
    ON [fact].[SALE_OperationalSale_TurnoverAgg];


GO

