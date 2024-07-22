CREATE TABLE [stg].[APC_ATS_TimeUniqueJourneyPattern_Rule10] (
    [Period]               INT            NOT NULL,
    [OperatingDayType]     SMALLINT       NOT NULL,
    [LineDesignation]      NVARCHAR (8)   NULL,
    [JourneyStartTime]     TIME (0)       NOT NULL,
    [JourneyPatternId]     NVARCHAR (17)  NOT NULL,
    [GroupByKey]           NVARCHAR (50)  NOT NULL,
    [ObservedJourneyCount] INT            NOT NULL,
    [BoardingCountAvg]     DECIMAL (8, 2) NULL,
    [AlightingCountAvg]    DECIMAL (8, 2) NULL,
    CONSTRAINT [PK_APC_ATS_TimeUniqueJourneyPattern_Rule10] PRIMARY KEY CLUSTERED ([Period] ASC, [OperatingDayType] ASC, [JourneyPatternId] ASC, [JourneyStartTime] ASC)
);


GO

