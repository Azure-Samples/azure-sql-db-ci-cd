CREATE TABLE [data].[RT_DOI_PointInJourneyPattern] (
    [SourceSystemCode]                    NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]                 BIGINT        NOT NULL,
    [JourneyPatternId]                    BIGINT        NOT NULL,
    [SequenceNumber]                      SMALLINT      NOT NULL,
    [JourneyPatternPointGid]              BIGINT        NOT NULL,
    [VisitNumber]                         SMALLINT      NOT NULL,
    [DepartureType]                       TINYINT       NOT NULL,
    [ArrivalType]                         TINYINT       NOT NULL,
    [StopPointOwner]                      INT           NULL,
    [StopPointNumber]                     INT           NULL,
    [StopPointSequenceNumber]             SMALLINT      NULL,
    [IsTimingPoint]                       BIT           NULL,
    [TimingPointSequenceNumber]           SMALLINT      NULL,
    [JourneyPatternGroupCode]             NVARCHAR (20) NULL,
    [TopologicalOrder]                    SMALLINT      NULL,
    [LineDirectionTopologicalOrder]       SMALLINT      NULL,
    [LineDirectionLegacyOrder]            INT           NULL,
    [JourneyPatternGroupTopologicalOrder] SMALLINT      NULL,
    CONSTRAINT [PK_RT_DOI_PointInJourneyPattern] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC),
    CONSTRAINT [BK_RT_DOI_PointInJourneyPattern] UNIQUE NONCLUSTERED ([JourneyPatternId] ASC, [SequenceNumber] ASC)
);


GO

