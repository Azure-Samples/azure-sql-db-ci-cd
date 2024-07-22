CREATE TABLE [integration].[SALE_OperationalSale_BaseFilterNav] (
    [SourceSystemCode] NVARCHAR (30)  NOT NULL,
    [ItemBridgeRef]    NVARCHAR (50)  NOT NULL,
    [ItemNo]           NVARCHAR (20)  NOT NULL,
    [ItemName]         NVARCHAR (250) NOT NULL,
    [MinPostingDate]   DATE           NULL,
    [Inserted]         DATETIME2 (0)  NULL,
    [Updated]          DATETIME2 (0)  NULL,
    [Hash]             VARBINARY (32) NULL,
    CONSTRAINT [PK_SALE_OperationalSale_BaseFilterNav] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [ItemBridgeRef] ASC)
);


GO

