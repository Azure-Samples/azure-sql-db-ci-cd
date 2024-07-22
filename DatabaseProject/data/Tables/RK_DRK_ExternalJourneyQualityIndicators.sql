CREATE TABLE [data].[RK_DRK_ExternalJourneyQualityIndicators] (
    [SourceSystemCode]        NVARCHAR (11)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (121) NOT NULL,
    [ExternalJourneyId]       NVARCHAR (36)  NOT NULL,
    [JourneyId]               NVARCHAR (36)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NOT NULL,
    [MetricCode]              NVARCHAR (50)  NULL,
    [QualityIndicator]        DECIMAL (18)   NULL,
    [Hash]                    BINARY (32)    NULL,
    [Inserted]                DATETIME2 (0)  NULL,
    [Updated]                 DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RK_DRK_ExternalJourneyQualityIndicators] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

