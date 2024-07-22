CREATE TABLE [data].[SHR_AnalysisServices_ProcessRequest] (
    [Id]               UNIQUEIDENTIFIER NOT NULL,
    [Server]           NVARCHAR (250)   NULL,
    [Model]            NVARCHAR (250)   NULL,
    [RequestTimeUtc]   DATETIME2 (3)    NULL,
    [ProcessStatement] NVARCHAR (MAX)   NULL,
    [RefreshId]        UNIQUEIDENTIFIER NULL,
    [Status]           NVARCHAR (250)   NULL,
    [ResultOutput]     NVARCHAR (MAX)   NULL,
    [LastUpdatedUtc]   DATETIME2 (3)    NULL,
    CONSTRAINT [PK_SHR_AnalysisServices_ProcessRequest] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

