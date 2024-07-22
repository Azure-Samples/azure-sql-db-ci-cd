CREATE TABLE [fact].[PAX_StopPoint] (
    [SourceSystemKey]                INT             NOT NULL,
    [DateKey]                        INT             NOT NULL,
    [OperatingDayTypeKey]            INT             NOT NULL,
    [TimeKey]                        INT             NOT NULL,
    [JourneyPatternKey]              INT             NOT NULL,
    [StopPointKey]                   INT             NOT NULL,
    [SourceSystemCode]               NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryId]            BIGINT          NULL,
    [TypeOfDay]                      SMALLINT        NOT NULL,
    [LineNumber]                     INT             NOT NULL,
    [LineDesignation]                NVARCHAR (8)    NOT NULL,
    [JourneyPatternId]               BIGINT          NOT NULL,
    [DirectionCode]                  INT             NOT NULL,
    [StartJourneyPatternPointNumber] INT             NOT NULL,
    [JourneyPatternPointCount]       INT             NOT NULL,
    [JourneyStartTime]               TIME (0)        NOT NULL,
    [StopPointNumber]                INT             NOT NULL,
    [SequenceNumber]                 TINYINT         NOT NULL,
    [JourneyCount]                   INT             NOT NULL,
    [BoardersWeightAvg]              DECIMAL (8, 7)  NULL,
    [AlightersWeightAvg]             DECIMAL (8, 7)  NULL,
    [OccupancyAvg]                   DECIMAL (12, 7) NULL,
    [EnumerationRuleKey]             INT             NULL,
    [PlannedDistanceMetersAvg]       DECIMAL (12, 2) NULL,
    [EnumerationRuleNumber]          INT             NULL,
    CONSTRAINT [PK_PAX_StopPoint] PRIMARY KEY CLUSTERED ([SourceSystemKey] ASC, [DateKey] ASC, [OperatingDayTypeKey] ASC, [TimeKey] ASC, [JourneyPatternKey] ASC, [SequenceNumber] ASC)
);


GO

