CREATE TABLE [stg].[RK_DRK_ExternalJourneyQualityIndicators] (
    [SourceSystemCode]        NVARCHAR (10)  NULL,
    [SourceSystemEntryRef]    NVARCHAR (200) NULL,
    [ExternalJourneyId]       NVARCHAR (50)  NOT NULL,
    [JourneyId]               NVARCHAR (50)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NULL,
    [MetricCode]              NVARCHAR (50)  NULL,
    [QualityIndicator]        DECIMAL (18)   NULL
);


GO

