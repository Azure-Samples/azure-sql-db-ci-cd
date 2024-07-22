CREATE TABLE [stg].[RK_SalesStatement_FileState] (
    [FileName]           NVARCHAR (100) NOT NULL,
    [FileSequenceNumber] INT            NULL,
    [FileDate]           DATE           NULL,
    [FileFormatVersion]  NVARCHAR (8)   NULL,
    [InsertDateTime]     DATETIME       NULL,
    [State]              INT            NULL,
    CONSTRAINT [PK_RK_SalesStatements_FileState] PRIMARY KEY CLUSTERED ([FileName] ASC)
);


GO

