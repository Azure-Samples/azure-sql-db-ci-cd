CREATE TABLE [data].[SALE_CommuterCard] (
    [Date]      DATE            NOT NULL,
    [SalesType] NVARCHAR (255)  NOT NULL,
    [Quantity]  NUMERIC (20, 3) NULL,
    [Amount]    NUMERIC (20, 3) NULL,
    [Inserted]  DATETIME2 (0)   NULL,
    [Updated]   DATETIME2 (0)   NULL,
    [Hash]      VARBINARY (32)  NULL,
    CONSTRAINT [PK_SALE_CommuterCard] PRIMARY KEY CLUSTERED ([Date] ASC, [SalesType] ASC)
);


GO

