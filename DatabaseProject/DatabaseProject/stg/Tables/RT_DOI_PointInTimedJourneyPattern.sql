CREATE TABLE [stg].[RT_DOI_PointInTimedJourneyPattern] (
    [SourceSystemCode]                     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]                  BIGINT        NOT NULL,
    [TimedJourneyPatternId]                BIGINT        NULL,
    [JourneyPatternId]                     BIGINT        NULL,
    [SequenceNumber]                       SMALLINT      NULL,
    [JourneyPatternPointGid]               BIGINT        NULL,
    [VisitNumber]                          SMALLINT      NULL,
    [EarliestDepartureTimeOffsetSeconds]   INT           NULL,
    [LatestArrivalTimeOffsetSeconds]       INT           NULL,
    [DepartureType]                        TINYINT       NULL,
    [ArrivalType]                          TINYINT       NULL,
    [IsStopPoint]                          BIT           NULL,
    [StopPointId]                          INT           NULL,
    [StopPointOwner]                       INT           NULL,
    [StopPointNumber]                      INT           NULL,
    [StopPointSequenceNumber]              SMALLINT      NULL,
    [IsTimingPoint]                        BIT           NULL,
    [TimingPointSequenceNumber]            SMALLINT      NULL,
    [PrecedingPointJourneyPatternPointGid] BIGINT        NULL,
    [PrecedingPointStopPointId]            INT           NULL,
    [PrecedingLinkRunTimeSeconds]          INT           NULL,
    [FollowingPointJourneyPatternPointGid] BIGINT        NULL,
    [FollowingPointStopPointId]            INT           NULL,
    [FollowingLinkRunTimeSeconds]          INT           NULL,
    [DwellTimeSeconds]                     INT           NULL,
    [IsFirstPoint]                         BIT           NULL,
    [IsLastPoint]                          BIT           NULL,
    [TotalPointCount]                      SMALLINT      NULL,
    [TotalRunTimeSeconds]                  INT           NULL,
    [TotalDwellTimeSeconds]                INT           NULL,
    CONSTRAINT [PK_RT_DOI_PointInTimedJourneyPattern] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

