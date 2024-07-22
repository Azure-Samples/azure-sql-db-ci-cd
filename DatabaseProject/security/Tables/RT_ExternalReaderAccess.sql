CREATE TABLE [security].[RT_ExternalReaderAccess] (
    [ExternalReaderCode]     NVARCHAR (20)  NOT NULL,
    [ExternalReaderUsername] NVARCHAR (100) NOT NULL,
    [Inserted]               DATETIME2 (0)  NOT NULL,
    [Updated]                DATETIME2 (7)  NULL,
    CONSTRAINT [PK_RT_ExternalReaderAccess] PRIMARY KEY CLUSTERED ([ExternalReaderCode] ASC, [ExternalReaderUsername] ASC)
);


GO

