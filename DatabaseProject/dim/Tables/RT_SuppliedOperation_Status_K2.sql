CREATE TABLE [dim].[RT_SuppliedOperation_Status_K2] (
    [K2StatusKey] INT           NOT NULL,
    [Status]      NVARCHAR (15) NULL,
    [K2StatusId]  SMALLINT      NULL,
    CONSTRAINT [PK_RT_SuppliedOperation_Status_K2] PRIMARY KEY CLUSTERED ([K2StatusKey] ASC)
);


GO

