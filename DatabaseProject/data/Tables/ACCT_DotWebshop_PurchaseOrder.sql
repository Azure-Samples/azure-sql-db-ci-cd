CREATE TABLE [data].[ACCT_DotWebshop_PurchaseOrder] (
    [OrderId]               INT              NOT NULL,
    [OrderNumber]           NVARCHAR (50)    NULL,
    [CustomerId]            INT              NULL,
    [OrderStatusId]         INT              NULL,
    [CreatedDate]           DATETIME2 (0)    NULL,
    [CompletedDate]         DATETIME2 (0)    NULL,
    [CurrencyId]            INT              NULL,
    [ProductCatalogGroupId] INT              NULL,
    [BillingAddressId]      INT              NULL,
    [Note]                  NVARCHAR (MAX)   NULL,
    [BasketId]              UNIQUEIDENTIFIER NULL,
    [VAT]                   MONEY            NULL,
    [OrderTotal]            MONEY            NULL,
    [ShippingTotal]         MONEY            NULL,
    [PaymentTotal]          MONEY            NULL,
    [TaxTotal]              MONEY            NULL,
    [SubTotal]              MONEY            NULL,
    [OrderGuid]             UNIQUEIDENTIFIER NULL,
    [ModifiedOn]            DATETIME2 (0)    NULL,
    [CultureCode]           NVARCHAR (60)    NULL,
    [Discount]              MONEY            NULL,
    [DiscountTotal]         MONEY            NULL,
    [Guid]                  UNIQUEIDENTIFIER NULL,
    [Inserted]              DATETIME2 (0)    NULL,
    [Updated]               DATETIME2 (0)    NULL,
    [Hash]                  VARBINARY (32)   NULL,
    CONSTRAINT [PK_ACCT_DotWebshop_PurchaseOrder] PRIMARY KEY CLUSTERED ([OrderId] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_DotWebshop_PurchaseOrder]
    ON [data].[ACCT_DotWebshop_PurchaseOrder]([OrderId] ASC)
    INCLUDE([OrderNumber], [CreatedDate]);


GO

