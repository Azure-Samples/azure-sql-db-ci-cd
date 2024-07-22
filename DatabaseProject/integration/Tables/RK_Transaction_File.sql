CREATE TABLE [integration].[RK_Transaction_File] (
    [Id]       INT            IDENTITY (1, 1) NOT NULL,
    [FilePath] NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_RK_Transaction_File] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RK_Transaction_File]
    ON [integration].[RK_Transaction_File]([FilePath] ASC);


GO

