CREATE TABLE [stg].[APC_ATS_TimeUniqueJourneyPatternImputed] (
    [TimeUniqueJourneyPatternRef] NVARCHAR (50)  NULL,
    [Period]                      INT            NOT NULL,
    [OperatingDayType]            SMALLINT       NOT NULL,
    [LineNumber]                  INT            NOT NULL,
    [LineDesignation]             NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]            NUMERIC (16)   NOT NULL,
    [DirectionCode]               INT            NOT NULL,
    [JourneyStartTime]            TIME (0)       NOT NULL,
    [JourneyCount]                INT            NOT NULL,
    [ImputationRule]              INT            NULL,
    [ObservedJourneyCount]        INT            NULL,
    [BoardingCountAvg]            DECIMAL (8, 2) NULL,
    [AlightingCountAvg]           DECIMAL (8, 2) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_APC_ATS_JourneyImputation]
    ON [stg].[APC_ATS_TimeUniqueJourneyPatternImputed]([JourneyPatternId] ASC, [JourneyStartTime] ASC, [OperatingDayType] ASC);


GO

