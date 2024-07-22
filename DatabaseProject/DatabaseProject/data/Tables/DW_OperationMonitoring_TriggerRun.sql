CREATE TABLE [data].[DW_OperationMonitoring_TriggerRun] (
    [CorrelationId]     UNIQUEIDENTIFIER NOT NULL,
    [Time]              DATETIME2 (7)    NULL,
    [TriggerId]         NVARCHAR (255)   NULL,
    [ResourceId]        NVARCHAR (255)   NULL,
    [Category]          NVARCHAR (20)    NULL,
    [Level]             NVARCHAR (20)    NULL,
    [OperationName]     NVARCHAR (255)   NULL,
    [TriggerName]       NVARCHAR (255)   NULL,
    [TriggerType]       NVARCHAR (255)   NULL,
    [TriggerEvent]      NVARCHAR (255)   NULL,
    [Start]             DATETIME2 (7)    NULL,
    [Status]            NVARCHAR (20)    NOT NULL,
    [Location]          NVARCHAR (20)    NULL,
    [Properties]        NVARCHAR (MAX)   NULL,
    [Tags]              NVARCHAR (MAX)   NULL,
    [GroupId]           NVARCHAR (255)   NULL,
    [MeterId]           UNIQUEIDENTIFIER NULL,
    [BillingResourceId] NVARCHAR (255)   NULL,
    [SourceFilePath]    NVARCHAR (255)   NULL,
    [Environment]       NVARCHAR (20)    NULL,
    CONSTRAINT [PK_DW_OperationMonitoring_TriggerRun] PRIMARY KEY CLUSTERED ([CorrelationId] ASC)
);


GO

