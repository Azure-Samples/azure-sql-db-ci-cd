CREATE TABLE [stg_fact].[APC_CountingReport] (
    [SourceSystemKey]      INT           NOT NULL,
    [Period]               INT           NOT NULL,
    [DateKey]              INT           NULL,
    [OperatingDayTypeKey]  INT           NULL,
    [JourneyPatternKey]    INT           NULL,
    [ContractorKey]        INT           NULL,
    [GarageKey]            INT           NULL,
    [JourneyStartTimeKey]  INT           NULL,
    [OperatingDayType]     INT           NOT NULL,
    [JourneyPatternId]     NUMERIC (16)  NOT NULL,
    [ContractorCode]       NVARCHAR (20) NOT NULL,
    [GarageCode]           NVARCHAR (20) NOT NULL,
    [PlannedStartDateTime] TIME (0)      NOT NULL,
    [JourneyCount]         INT           NULL,
    [CountedJourneys]      INT           NULL,
    [ReadyJourneys]        INT           NULL,
    [NotReadyJourneys]     INT           NULL
);


GO

