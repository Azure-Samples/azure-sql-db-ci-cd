CREATE TABLE [dim].[RT_SuppliedOperation_Status_K5] (
    [K5StatusKey] INT           NOT NULL,
    [Status]      NVARCHAR (15) NULL,
    [K5StatusId]  SMALLINT      NULL,
    CONSTRAINT [PK_RT_SuppliedOperation_Status_K5] PRIMARY KEY CLUSTERED ([K5StatusKey] ASC)
);


GO

