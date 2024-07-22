CREATE TABLE [stg].[APC_JourneyPatternEnumeration] (
    [SourceSystemCode]               NVARCHAR (20)  NULL,
    [Period]                         INT            NOT NULL,
    [TypeOfDate]                     SMALLINT       NOT NULL,
    [LineNumber]                     INT            NOT NULL,
    [LineDesignation]                NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]               NUMERIC (16)   NOT NULL,
    [DirectionCode]                  INT            NOT NULL,
    [StartJourneyPatternPointNumber] INT            NOT NULL,
    [JourneyPatternPointCount]       INT            NOT NULL,
    [StopPointNumberSum]             INT            NULL,
    [JourneyStartTime]               TIME (0)       NOT NULL,
    [GroupByKey]                     NVARCHAR (50)  NOT NULL,
    [JourneyCount]                   INT            NOT NULL,
    [EnumerationRule]                INT            NULL,
    [ObservationCount]               INT            NULL,
    [BoardersAvg]                    DECIMAL (8, 2) NULL,
    [AlightersAvg]                   DECIMAL (8, 2) NULL,
    CONSTRAINT [PK_APC_JourneyPatternEnumeration] PRIMARY KEY CLUSTERED ([Period] ASC, [TypeOfDate] ASC, [JourneyPatternId] ASC, [JourneyStartTime] ASC)
);


GO

