CREATE TABLE [dbo].[$__schema_journal] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [ScriptName] NVARCHAR (255) NOT NULL,
    [Applied]    DATETIME       NOT NULL,
    CONSTRAINT [PK_$__schema_journal_Id] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

