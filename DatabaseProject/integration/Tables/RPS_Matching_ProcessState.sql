CREATE TABLE [integration].[RPS_Matching_ProcessState] (
    [Date]                   DATE          NOT NULL,
    [MatchedPositionCount]   INT           NULL,
    [LastProcessedTimestamp] DATETIME2 (0) NULL,
    [MatchedJourneyCount]    INT           NULL,
    CONSTRAINT [PK_RPS_Matching_ProcessState] PRIMARY KEY CLUSTERED ([Date] ASC)
);


GO

