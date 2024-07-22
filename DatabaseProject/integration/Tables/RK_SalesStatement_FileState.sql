CREATE TABLE [integration].[RK_SalesStatement_FileState] (
    [Id]                 INT            IDENTITY (1, 1) NOT NULL,
    [FileName]           NVARCHAR (100) NOT NULL,
    [FileSequenceNumber] INT            NOT NULL,
    [FileDate]           DATE           NOT NULL,
    [FileFormatVersion]  NVARCHAR (8)   NOT NULL,
    [InsertDateTime]     DATETIME       NOT NULL,
    [State]              INT            CONSTRAINT [DF_RK_SalesStatements_FileState_State] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_RK_SalesStatements_FileState] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RK_SalesStatements_FileState]
    ON [integration].[RK_SalesStatement_FileState]([FileName] ASC);


GO

