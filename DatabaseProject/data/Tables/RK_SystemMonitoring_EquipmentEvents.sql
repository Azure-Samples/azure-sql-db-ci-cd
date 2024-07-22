CREATE TABLE [data].[RK_SystemMonitoring_EquipmentEvents] (
    [Id]                   NUMERIC (18)   NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (400) NOT NULL,
    [SourceSystemCode]     NVARCHAR (50)  NULL,
    [EventId]              NUMERIC (18)   NULL,
    [GenerationDate]       DATETIME2 (0)  NULL,
    [ReceptionDate]        DATETIME2 (2)  NULL,
    [Source]               NVARCHAR (50)  NULL,
    [SourceLabelName]      NVARCHAR (50)  NULL,
    [SourceSamId]          NVARCHAR (255) NULL,
    [SourceLocalization]   NUMERIC (18)   NULL,
    [SourceType]           NVARCHAR (50)  NULL,
    [IPAddress]            NUMERIC (18)   NULL,
    [EventType]            NVARCHAR (50)  NULL,
    [ShortExplanation]     NVARCHAR (255) NULL,
    [EventValue]           NVARCHAR (50)  NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    [Hash]                 BINARY (50)    NULL,
    CONSTRAINT [PK_RK_SystemMonitoring_EquipmentEvents] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

