CREATE TABLE [dim].[SALE_OperationalSale_PaymentMethod] (
    [PaymentMethodKey]               INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]               NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]           NVARCHAR (30)  NOT NULL,
    [PaymentMethodName]              NVARCHAR (250) NULL,
    [PaymentMethodDisplayIndex]      INT            NULL,
    [PaymentMethodCode]              NVARCHAR (30)  NOT NULL,
    [PaymentMethodGroupDisplayName]  NVARCHAR (250) NULL,
    [PaymentMethodDisplayName]       NVARCHAR (250) NULL,
    [PaymentMethodGroupDisplayIndex] INT            NULL,
    [ValidFromDate]                  DATE           NULL,
    [ValidToDate]                    DATE           NULL,
    [IsCurrent]                      BIT            NULL,
    [PaymentMethodGroupName]         NVARCHAR (30)  NULL,
    [Inserted]                       DATETIME2 (0)  NULL,
    [Updated]                        DATETIME2 (0)  NULL,
    [Hash]                           VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_OperationalSale_PaymentMethod] PRIMARY KEY CLUSTERED ([PaymentMethodKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [SALE_OperationalSale_PaymentMethod_Merge]
    ON [dim].[SALE_OperationalSale_PaymentMethod]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([PaymentMethodKey], [PaymentMethodName], [PaymentMethodDisplayIndex], [PaymentMethodCode], [PaymentMethodGroupDisplayName], [PaymentMethodDisplayName], [PaymentMethodGroupDisplayIndex], [ValidFromDate], [ValidToDate], [IsCurrent], [PaymentMethodGroupName], [Inserted], [Updated]);


GO

