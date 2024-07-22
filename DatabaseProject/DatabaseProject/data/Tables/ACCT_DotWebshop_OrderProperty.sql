CREATE TABLE [data].[ACCT_DotWebshop_OrderProperty] (
    [OrderPropertyId] INT              NOT NULL,
    [OrderId]         INT              NULL,
    [OrderLineId]     INT              NULL,
    [Key]             NVARCHAR (255)   NULL,
    [Value]           NVARCHAR (MAX)   NULL,
    [Guid]            UNIQUEIDENTIFIER NULL,
    [Inserted]        DATETIME2 (0)    NULL,
    [Updated]         DATETIME2 (0)    NULL,
    [Hash]            VARBINARY (32)   NULL,
    CONSTRAINT [PK_ACCT_DotWebshop_OrderProperty] PRIMARY KEY CLUSTERED ([OrderPropertyId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_ACCT_DotWebshop_OrderProperty]
    ON [data].[ACCT_DotWebshop_OrderProperty]([OrderId] ASC, [OrderLineId] ASC)
    INCLUDE([Key], [Value]);


GO

