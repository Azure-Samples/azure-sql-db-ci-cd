CREATE TABLE [stg].[DW_OperationMonitoring_PipelineRun] (
    [correlationId]  NVARCHAR (MAX) NULL,
    [time]           DATETIME2 (7)  NULL,
    [pipelineRunId]  NVARCHAR (MAX) NULL,
    [resourceId]     NVARCHAR (MAX) NULL,
    [category]       NVARCHAR (MAX) NULL,
    [level]          NVARCHAR (MAX) NULL,
    [operationName]  NVARCHAR (MAX) NULL,
    [pipelineName]   NVARCHAR (MAX) NULL,
    [start]          DATETIME2 (7)  NULL,
    [end]            DATETIME2 (7)  NULL,
    [status]         NVARCHAR (MAX) NULL,
    [location]       NVARCHAR (MAX) NULL,
    [properties]     NVARCHAR (MAX) NULL,
    [tags]           NVARCHAR (MAX) NULL,
    [groupId]        NVARCHAR (MAX) NULL,
    [sourceFilePath] NVARCHAR (MAX) NULL,
    [environment]    NVARCHAR (MAX) NULL
);


GO

