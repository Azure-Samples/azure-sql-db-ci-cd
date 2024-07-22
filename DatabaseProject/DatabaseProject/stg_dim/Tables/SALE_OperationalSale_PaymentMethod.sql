CREATE TABLE [stg_dim].[SALE_OperationalSale_PaymentMethod] (
    [SourceSystemCode]               NVARCHAR (20)  NOT NULL,
    [PaymentMethodCode]              NVARCHAR (30)  NOT NULL,
    [PaymentMethodName]              NVARCHAR (250) NULL,
    [PaymentMethodDisplayIndex]      INT            NULL,
    [PaymentMethodGroupDisplayName]  NVARCHAR (250) NULL,
    [PaymentMethodDisplayName]       NVARCHAR (250) NULL,
    [PaymentMethodGroupDisplayIndex] INT            NULL,
    [ValidFromDate]                  DATE           NULL,
    [ValidToDate]                    DATE           NULL,
    [IsCurrent]                      BIT            NULL,
    [SourceSystemEntryRef]           NVARCHAR (30)  NULL,
    [PaymentMethodGroupName]         NVARCHAR (30)  NULL
);


GO

