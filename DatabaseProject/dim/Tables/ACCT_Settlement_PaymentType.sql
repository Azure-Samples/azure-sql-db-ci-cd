CREATE TABLE [dim].[ACCT_Settlement_PaymentType] (
    [PaymentTypeKey]      INT             IDENTITY (1, 1) NOT NULL,
    [PaymentTypeCategory] NVARCHAR (20)   NOT NULL,
    [Description]         NVARCHAR (2000) NULL,
    [Rate]                FLOAT (53)      NULL
);


GO

