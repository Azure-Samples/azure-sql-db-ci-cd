CREATE TABLE [stg_fact].[PAX_StopPoint] (
    [SourceSystemKey]                INT             NULL,
    [DateKey]                        INT             NULL,
    [OperatingDayTypeKey]            INT             NULL,
    [TimeKey]                        INT             NULL,
    [JourneyPatternKey]              INT             NULL,
    [EnumerationRuleKey]             INT             NULL,
    [StopPointKey]                   INT             NULL,
    [SourceSystemCode]               NVARCHAR (20)   NULL,
    [SourceSystemEntryId]            BIGINT          NULL,
    [Period]                         INT             NULL,
    [TypeOfDay]                      SMALLINT        NULL,
    [LineNumber]                     INT             NULL,
    [LineDesignation]                NVARCHAR (8)    NULL,
    [DirectionCode]                  INT             NULL,
    [JourneyPatternId]               BIGINT          NULL,
    [StartJourneyPatternPointNumber] INT             NULL,
    [JourneyPatternPointCount]       INT             NULL,
    [JourneyStartTime]               TIME (0)        NULL,
    [EnumerationRuleNumber]          INT             NULL,
    [StopPointNumber]                INT             NULL,
    [SequenceNumber]                 TINYINT         NULL,
    [PlannedDistanceMetersAvg]       DECIMAL (12, 2) NULL,
    [JourneyCount]                   INT             NULL,
    [BoardersWeightAvg]              DECIMAL (8, 7)  NULL,
    [AlightersWeightAvg]             DECIMAL (8, 7)  NULL,
    [OccupancyAvg]                   DECIMAL (12, 7) NULL
);


GO

