CREATE TABLE [integration].[APC_ATS_FileState] (
    [FileRef]     NVARCHAR (255) NOT NULL,
    [State]       INT            NOT NULL,
    [FromUtcTime] DATETIME2 (0)  NULL,
    [ToUtcTime]   DATETIME2 (0)  NULL,
    [InsertedUtc] DATETIME2 (0)  NOT NULL,
    [UpdatedUtc]  DATETIME2 (0)  NULL,
    CONSTRAINT [PK_APC_ATS_FileState] PRIMARY KEY CLUSTERED ([FileRef] ASC)
);


GO

