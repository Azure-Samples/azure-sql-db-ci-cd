CREATE TABLE [stg].[ACCT_DotWebshop_OrderAddress] (
    [OrderAddressId]    INT              NULL,
    [FirstName]         NVARCHAR (512)   NULL,
    [LastName]          NVARCHAR (512)   NULL,
    [EmailAddress]      NVARCHAR (255)   NULL,
    [PhoneNumber]       NVARCHAR (50)    NULL,
    [MobilePhoneNumber] NVARCHAR (50)    NULL,
    [Line1]             NVARCHAR (512)   NULL,
    [Line2]             NVARCHAR (512)   NULL,
    [PostalCode]        NVARCHAR (50)    NULL,
    [City]              NVARCHAR (512)   NULL,
    [State]             NVARCHAR (512)   NULL,
    [CountryId]         INT              NULL,
    [Attention]         NVARCHAR (512)   NULL,
    [CompanyName]       NVARCHAR (512)   NULL,
    [AddressName]       NVARCHAR (512)   NULL,
    [OrderId]           INT              NULL,
    [Guid]              UNIQUEIDENTIFIER NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_DotWebshop_OrderAddress_Merge]
    ON [stg].[ACCT_DotWebshop_OrderAddress]([OrderAddressId] ASC)
    INCLUDE([FirstName], [LastName], [EmailAddress], [PhoneNumber], [MobilePhoneNumber], [Line1], [Line2], [PostalCode], [City], [State], [CountryId], [Attention], [CompanyName], [AddressName], [OrderId], [Guid]);


GO

