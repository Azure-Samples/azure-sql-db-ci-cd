CREATE TABLE [stg].[RK_ServiceJourneyBridge] (
    [Number]               BIGINT       NULL,
    [OwnerNumber]          INT          NULL,
    [ServiceJourneyNumber] INT          NULL,
    [StartTimeOffset]      INT          NULL,
    [EndTimeOffset]        INT          NULL,
    [JourneyPatternNumber] INT          NULL,
    [ServiceJourneyGid]    NUMERIC (16) NULL
);


GO

