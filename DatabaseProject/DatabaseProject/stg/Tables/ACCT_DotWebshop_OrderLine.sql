CREATE TABLE [stg].[ACCT_DotWebshop_OrderLine] (
    [OrderLineId]  INT              NULL,
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
    [Guid]         UNIQUEIDENTIFIER NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_DotWebshop_OrderLine_Merge]
    ON [stg].[ACCT_DotWebshop_OrderLine]([OrderLineId] ASC)
    INCLUDE([OrderId], [Sku], [ProductName], [Price], [Quantity], [CreatedOn], [Discount], [VAT], [Total], [VATRate], [VariantSku], [ShipmentId], [UnitDiscount], [CreatedBy], [Guid]);


GO

