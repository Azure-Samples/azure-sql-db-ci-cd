CREATE TABLE [data].[DW_OperationMonitoring_PipelineRun] (
    [CorrelationId]  UNIQUEIDENTIFIER NULL,
    [Time]           DATETIME2 (7)    NULL,
    [PipelineRunId]  UNIQUEIDENTIFIER NOT NULL,
    [ResourceId]     NVARCHAR (255)   NULL,
    [Category]       NVARCHAR (255)   NULL,
    [Level]          NVARCHAR (20)    NULL,
    [OperationName]  NVARCHAR (255)   NULL,
    [PipelineName]   NVARCHAR (255)   NULL,
    [Start]          DATETIME2 (7)    NULL,
    [End]            DATETIME2 (7)    NULL,
    [Status]         NVARCHAR (20)    NOT NULL,
    [Location]       NVARCHAR (20)    NULL,
    [Properties]     NVARCHAR (MAX)   NULL,
    [Tags]           NVARCHAR (MAX)   NULL,
    [GroupId]        UNIQUEIDENTIFIER NULL,
    [SourceFilePath] NVARCHAR (255)   NULL,
    [Environment]    NVARCHAR (20)    NULL,
    CONSTRAINT [PK_DW_OperationMonitoring_PipelineRun] PRIMARY KEY CLUSTERED ([PipelineRunId] ASC, [Status] ASC)
);


GO

