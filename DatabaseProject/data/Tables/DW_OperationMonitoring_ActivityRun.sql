CREATE TABLE [data].[DW_OperationMonitoring_ActivityRun] (
    [CorrelationId]               NVARCHAR (36)  NULL,
    [Time]                        DATETIME2 (7)  NULL,
    [ActivityRunId]               NVARCHAR (36)  NOT NULL,
    [PipelineRunId]               NVARCHAR (36)  NULL,
    [ResourceId]                  NVARCHAR (MAX) NULL,
    [Category]                    NVARCHAR (MAX) NULL,
    [Level]                       NVARCHAR (MAX) NULL,
    [OperationName]               NVARCHAR (MAX) NULL,
    [ActivityIterationCount]      BIGINT         NULL,
    [PipelineName]                NVARCHAR (MAX) NULL,
    [ActivityName]                NVARCHAR (MAX) NULL,
    [Start]                       DATETIME2 (7)  NULL,
    [End]                         DATETIME2 (7)  NULL,
    [Status]                      NVARCHAR (255) NOT NULL,
    [Location]                    NVARCHAR (MAX) NULL,
    [Properties]                  NVARCHAR (MAX) NULL,
    [ActivityType]                NVARCHAR (MAX) NULL,
    [Tags]                        NVARCHAR (MAX) NULL,
    [RecoveryStatus]              NVARCHAR (MAX) NULL,
    [ActivityRetryCount]          BIGINT         NULL,
    [BillingResourceId]           NVARCHAR (MAX) NULL,
    [EffectiveIntegrationRuntime] NVARCHAR (MAX) NULL,
    [MeterId]                     NVARCHAR (36)  NULL,
    [SourceFilePath]              NVARCHAR (MAX) NULL,
    [Environment]                 NVARCHAR (50)  NULL,
    CONSTRAINT [PK_DW_OperationMonitoring_ActivityRun] PRIMARY KEY CLUSTERED ([ActivityRunId] ASC, [Status] ASC)
);


GO

