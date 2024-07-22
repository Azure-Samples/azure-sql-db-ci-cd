CREATE TABLE [data].[ACCT_DotWebshop_OrderAddress] (
    [OrderAddressId]    INT              NOT NULL,
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
    [Guid]              UNIQUEIDENTIFIER NULL,
    [Inserted]          DATETIME2 (0)    NULL,
    [Updated]           DATETIME2 (0)    NULL,
    [Hash]              VARBINARY (32)   NULL,
    CONSTRAINT [PK_ACCT_DotWebshop_OrderAddress] PRIMARY KEY CLUSTERED ([OrderAddressId] ASC)
);


GO

