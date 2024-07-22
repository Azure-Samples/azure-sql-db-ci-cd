CREATE TABLE [fact].[APC_CountingReport] (
    [SourceSystemKey]     INT NOT NULL,
    [Period]              INT NOT NULL,
    [DateKey]             INT NULL,
    [OperatingDayTypeKey] INT NOT NULL,
    [JourneyPatternKey]   INT NOT NULL,
    [ContractorKey]       INT NOT NULL,
    [GarageKey]           INT NOT NULL,
    [JourneyStartTimeKey] INT NOT NULL,
    [JourneyCount]        INT NULL,
    [CountedJourneys]     INT NULL,
    [ReadyJourneys]       INT NULL,
    [NotReadyJourneys]    INT NULL
);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_APC_CountingReport]
    ON [fact].[APC_CountingReport];


GO

