CREATE TABLE [data].[ACCT_DotApp_Order] (
    [Id]                               UNIQUEIDENTIFIER NOT NULL,
    [PurchaseToken]                    NVARCHAR (MAX)   NULL,
    [DIBSOrderNumber]                  NVARCHAR (50)    NULL,
    [TransactionNumber]                NVARCHAR (50)    NULL,
    [MoviaTransactionNumber]           NVARCHAR (MAX)   NULL,
    [MobilePayRefundTransactionNumber] NVARCHAR (MAX)   NULL,
    [MobilePayTransactionNumber]       NVARCHAR (50)    NULL,
    [MoviaRefundNumber]                NVARCHAR (MAX)   NULL,
    [Price]                            INT              NOT NULL,
    [_purchaseDate]                    DATETIME2 (7)    NULL,
    [DeliveryPlatform]                 NVARCHAR (MAX)   NULL,
    [PurchasePlatform]                 NVARCHAR (MAX)   NULL,
    [RelationReference]                NVARCHAR (MAX)   NULL,
    [Transferred]                      INT              NOT NULL,
    [PayType]                          INT              NOT NULL,
    [PaymentReference]                 NVARCHAR (MAX)   NULL,
    [LastModified]                     DATETIME2 (7)    NULL,
    [CustomerId]                       UNIQUEIDENTIFIER NOT NULL,
    [ModifiedOn]                       DATETIME2 (7)    NOT NULL,
    [CreatedOn]                        DATETIME2 (7)    NOT NULL,
    [CreditCard_Id]                    UNIQUEIDENTIFIER NULL,
    [CustomerAtPurchase_id]            UNIQUEIDENTIFIER NULL,
    [Device_Id]                        UNIQUEIDENTIFIER NULL,
    [JourneyClasses_Id]                UNIQUEIDENTIFIER NULL,
    [OrderStatus_Id]                   UNIQUEIDENTIFIER NULL,
    [RejseplanenProduct_Id]            UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_ACCT_DotApp_Order] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

