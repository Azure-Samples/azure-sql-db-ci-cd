CREATE TABLE [stg].[RT_DOI_PointInJourneyPattern] (
    [SourceSystemCode]                    NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]                 BIGINT        NULL,
    [JourneyPatternId]                    BIGINT        NULL,
    [SequenceNumber]                      SMALLINT      NULL,
    [JourneyPatternPointGid]              BIGINT        NULL,
    [VisitNumber]                         SMALLINT      NULL,
    [DepartureType]                       TINYINT       NULL,
    [ArrivalType]                         TINYINT       NULL,
    [StopPointOwner]                      INT           NULL,
    [StopPointNumber]                     INT           NULL,
    [StopPointSequenceNumber]             SMALLINT      NULL,
    [IsTimingPoint]                       BIT           NULL,
    [TimingPointSequenceNumber]           SMALLINT      NULL,
    [JourneyPatternGroupCode]             NVARCHAR (20) NULL,
    [LineDirectionTopologicalOrder]       SMALLINT      NULL,
    [LineDirectionLegacyOrder]            INT           NULL,
    [JourneyPatternGroupTopologicalOrder] SMALLINT      NULL
);


GO

CREATE CLUSTERED INDEX [IX_RT_DOI_PointInJourneyPattern]
    ON [stg].[RT_DOI_PointInJourneyPattern]([SourceSystemCode] ASC, [SourceSystemEntryId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_RT_DOI_PointInJourneyPattern_SourceSystemEntryId]
    ON [stg].[RT_DOI_PointInJourneyPattern]([SourceSystemEntryId] ASC)
    INCLUDE([SourceSystemCode]);


GO

