CREATE TABLE [stg].[DW_OperationMonitoring_ActivityRun] (
    [correlationId]               NVARCHAR (MAX) NULL,
    [time]                        DATETIME2 (7)  NULL,
    [activityRunId]               NVARCHAR (MAX) NULL,
    [pipelineRunId]               NVARCHAR (MAX) NULL,
    [resourceId]                  NVARCHAR (MAX) NULL,
    [category]                    NVARCHAR (MAX) NULL,
    [level]                       NVARCHAR (MAX) NULL,
    [operationName]               NVARCHAR (MAX) NULL,
    [activityIterationCount]      BIGINT         NULL,
    [pipelineName]                NVARCHAR (MAX) NULL,
    [activityName]                NVARCHAR (MAX) NULL,
    [start]                       DATETIME2 (7)  NULL,
    [end]                         DATETIME2 (7)  NULL,
    [status]                      NVARCHAR (MAX) NULL,
    [location]                    NVARCHAR (MAX) NULL,
    [properties]                  NVARCHAR (MAX) NULL,
    [activityType]                NVARCHAR (MAX) NULL,
    [tags]                        NVARCHAR (MAX) NULL,
    [recoveryStatus]              NVARCHAR (MAX) NULL,
    [activityRetryCount]          BIGINT         NULL,
    [billingResourceId]           NVARCHAR (MAX) NULL,
    [effectiveIntegrationRuntime] NVARCHAR (MAX) NULL,
    [meterId]                     NVARCHAR (MAX) NULL,
    [sourceFilePath]              NVARCHAR (MAX) NULL,
    [environment]                 NVARCHAR (MAX) NULL
);


GO

