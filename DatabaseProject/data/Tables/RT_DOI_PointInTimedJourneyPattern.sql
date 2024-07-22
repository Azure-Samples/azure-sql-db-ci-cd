CREATE TABLE [data].[RT_DOI_PointInTimedJourneyPattern] (
    [SourceSystemCode]                     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]                  BIGINT        NOT NULL,
    [TimedJourneyPatternId]                BIGINT        NOT NULL,
    [JourneyPatternId]                     BIGINT        NOT NULL,
    [SequenceNumber]                       SMALLINT      NOT NULL,
    [JourneyPatternPointGid]               BIGINT        NOT NULL,
    [VisitNumber]                          SMALLINT      NOT NULL,
    [EarliestDepartureTimeOffsetSeconds]   INT           NOT NULL,
    [LatestArrivalTimeOffsetSeconds]       INT           NOT NULL,
    [DepartureType]                        TINYINT       NOT NULL,
    [ArrivalType]                          TINYINT       NOT NULL,
    [StopPointOwner]                       INT           NULL,
    [StopPointNumber]                      INT           NULL,
    [StopPointSequenceNumber]              SMALLINT      NULL,
    [IsTimingPoint]                        BIT           NOT NULL,
    [TimingPointSequenceNumber]            SMALLINT      NULL,
    [PrecedingLinkRunTimeSeconds]          INT           NULL,
    [FollowingLinkRunTimeSeconds]          INT           NULL,
    [DwellTimeSeconds]                     INT           NULL,
    [IsFirstPoint]                         BIT           NULL,
    [IsLastPoint]                          BIT           NULL,
    [TotalPointCount]                      SMALLINT      NULL,
    [TotalRunTimeSeconds]                  INT           NULL,
    [TotalDwellTimeSeconds]                INT           NULL,
    [IsStopPoint]                          BIT           NULL,
    [StopPointId]                          INT           NULL,
    [PrecedingPointJourneyPatternPointGid] BIGINT        NULL,
    [FollowingPointJourneyPatternPointGid] BIGINT        NULL,
    [PrecedingPointStopPointId]            INT           NULL,
    [FollowingPointStopPointId]            INT           NULL,
    CONSTRAINT [PK_RT_DOI_PointInTimedJourneyPattern] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC),
    CONSTRAINT [BK_RT_DOI_PointInTimedJourneyPattern] UNIQUE NONCLUSTERED ([TimedJourneyPatternId] ASC, [SequenceNumber] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_DOI_PointInTimedJourneyPattern_TimedJourneyPatternId_SequenceNumber]
    ON [data].[RT_DOI_PointInTimedJourneyPattern]([TimedJourneyPatternId] ASC, [SequenceNumber] ASC)
    INCLUDE([JourneyPatternId], [JourneyPatternPointGid], [VisitNumber], [EarliestDepartureTimeOffsetSeconds], [LatestArrivalTimeOffsetSeconds], [DepartureType], [ArrivalType], [StopPointOwner], [StopPointNumber], [StopPointSequenceNumber], [IsTimingPoint], [TimingPointSequenceNumber], [PrecedingLinkRunTimeSeconds], [FollowingLinkRunTimeSeconds], [DwellTimeSeconds], [IsFirstPoint], [IsLastPoint], [TotalPointCount], [TotalRunTimeSeconds], [TotalDwellTimeSeconds], [IsStopPoint], [StopPointId], [PrecedingPointJourneyPatternPointGid], [FollowingPointJourneyPatternPointGid], [PrecedingPointStopPointId], [FollowingPointStopPointId]);


GO

