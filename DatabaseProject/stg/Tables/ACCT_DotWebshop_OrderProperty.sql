CREATE TABLE [stg].[ACCT_DotWebshop_OrderProperty] (
    [OrderPropertyId] INT              NULL,
    [OrderId]         INT              NULL,
    [OrderLineId]     INT              NULL,
    [Key]             NVARCHAR (255)   NULL,
    [Value]           NVARCHAR (MAX)   NULL,
    [Guid]            UNIQUEIDENTIFIER NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [QU_ACCT_DotWebshop_OrderProperty_Merge]
    ON [stg].[ACCT_DotWebshop_OrderProperty]([OrderPropertyId] ASC)
    INCLUDE([OrderId], [OrderLineId], [Key], [Value], [Guid]);


GO

