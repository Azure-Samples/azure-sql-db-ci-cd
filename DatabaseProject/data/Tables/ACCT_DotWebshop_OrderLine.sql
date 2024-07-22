CREATE TABLE [data].[ACCT_DotWebshop_OrderLine] (
    [OrderLineId]  INT              NOT NULL,
    [OrderId]      INT              NULL,
    [Sku]          NVARCHAR (512)   NULL,
    [ProductName]  NVARCHAR (512)   NULL,
    [Price]        MONEY            NULL,
    [Quantity]     INT              NULL,
    [CreatedOn]    DATETIME2 (0)    NULL,
    [Discount]     MONEY            NULL,
    [VAT]          MONEY            NULL,
    [Total]        MONEY            NULL,
    [VATRate]      MONEY            NULL,
    [VariantSku]   NVARCHAR (512)   NULL,
    [ShipmentId]   INT              NULL,
    [UnitDiscount] MONEY            NULL,
    [CreatedBy]    NVARCHAR (255)   NULL,
    [Guid]         UNIQUEIDENTIFIER NULL,
    [Inserted]     DATETIME2 (0)    NULL,
    [Updated]      DATETIME2 (0)    NULL,
    [Hash]         VARBINARY (32)   NULL,
    CONSTRAINT [PK_ACCT_DotWebshop_OrderLine] PRIMARY KEY CLUSTERED ([OrderLineId] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_ACCT_DotWebshop_OrderLine]
    ON [data].[ACCT_DotWebshop_OrderLine]([OrderId] ASC, [OrderLineId] ASC)
    INCLUDE([CreatedOn]);


GO

