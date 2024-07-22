CREATE TABLE [fact].[RT_DrivingDuration_Journey] (
    [JourneyRef]                  CHAR (18) NOT NULL,
    [DateKey]                     INT       NOT NULL,
    [TimeKey]                     INT       NOT NULL,
    [OperatingDayTypeKey]         INT       NOT NULL,
    [StrategicNetKey]             INT       NOT NULL,
    [JourneyPatternKey]           INT       NOT NULL,
    [OutlierClassificationKey]    INT       NOT NULL,
    [ContractorKey]               INT       NOT NULL,
    [ContractKey]                 INT       NOT NULL,
    [IsPlanned]                   TINYINT   NOT NULL,
    [IsObserved]                  TINYINT   NOT NULL,
    [PlannedDurationSeconds]      INT       NULL,
    [ObservedDurationSeconds]     INT       NULL,
    [DifferenceInDurationSeconds] INT       NULL,
    [Is2MinDelayed]               INT       NULL,
    [Is3MinDelayed]               INT       NULL,
    [Is5MinDelayed]               INT       NULL,
    [K2DelayedSeconds]            INT       NULL,
    [K3DelayedSeconds]            INT       NULL,
    [K5DelayedSeconds]            INT       NULL,
    CONSTRAINT [PK_RT_DrivingDuration_ContractorPerformance] UNIQUE NONCLUSTERED ([JourneyRef] ASC)
);


GO

