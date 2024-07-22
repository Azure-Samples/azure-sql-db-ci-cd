CREATE TABLE [stg].[RK_SystemMonitoring_EquipmentEvents] (
    [Id]                   NUMERIC (18)   NULL,
    [SourceSystemEntryRef] NVARCHAR (400) NULL,
    [SourceSystemCode]     NVARCHAR (255) NULL,
    [EventId]              NUMERIC (18)   NULL,
    [GenerationDate]       DATETIME2 (0)  NULL,
    [ReceptionDate]        DATETIME2 (2)  NULL,
    [Source]               NVARCHAR (255) NULL,
    [SourceLabelName]      NVARCHAR (255) NULL,
    [SourceSamId]          NVARCHAR (255) NULL,
    [SourceLocalization]   NUMERIC (18)   NULL,
    [SourceType]           NVARCHAR (255) NULL,
    [IPAddress]            NUMERIC (18)   NULL,
    [EventType]            NVARCHAR (255) NULL,
    [ShortExplanation]     NVARCHAR (255) NULL,
    [EventValue]           NVARCHAR (255) NULL
);


GO

