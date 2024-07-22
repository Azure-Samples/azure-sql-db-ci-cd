CREATE TABLE [integration].[RK_ServiceJourneyBridge] (
    [Number]               BIGINT       NOT NULL,
    [OwnerNumber]          INT          NOT NULL,
    [ServiceJourneyNumber] INT          NOT NULL,
    [StartTimeOffset]      INT          NOT NULL,
    [EndTimeOffset]        INT          NOT NULL,
    [JourneyPatternNumber] INT          NOT NULL,
    [ServiceJourneyGid]    NUMERIC (16) NOT NULL,
    CONSTRAINT [PK_RK_ServiceJourneyBridge] PRIMARY KEY CLUSTERED ([Number] ASC)
);


GO

