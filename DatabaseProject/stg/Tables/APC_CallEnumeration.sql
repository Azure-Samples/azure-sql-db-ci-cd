CREATE TABLE [stg].[APC_CallEnumeration] (
    [SourceSystemCode]               NVARCHAR (20)  NULL,
    [Period]                         INT            NOT NULL,
    [TypeOfDate]                     SMALLINT       NOT NULL,
    [LineNumber]                     INT            NOT NULL,
    [LineDesignation]                NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]               NUMERIC (16)   NOT NULL,
    [DirectionCode]                  INT            NOT NULL,
    [StartJourneyPatternPointNumber] INT            NOT NULL,
    [JourneyPatternPointCount]       INT            NOT NULL,
    [JourneyStartTime]               TIME (0)       NOT NULL,
    [GroupByKey]                     NVARCHAR (50)  NOT NULL,
    [JourneyCount]                   INT            NOT NULL,
    [StopPointNumber]                INT            NULL,
    [SequenceNumber]                 TINYINT        NOT NULL,
    [TimeGroup]                      NVARCHAR (1)   NULL,
    [CallEnumerationRule]            INT            NULL,
    [BoardersWeightAvg]              DECIMAL (8, 7) NULL,
    [AlightersWeightAvg]             DECIMAL (8, 7) NULL,
    CONSTRAINT [PK_APC_CallEnumeration_1] PRIMARY KEY CLUSTERED ([Period] ASC, [TypeOfDate] ASC, [JourneyPatternId] ASC, [JourneyStartTime] ASC, [SequenceNumber] ASC)
);


GO

