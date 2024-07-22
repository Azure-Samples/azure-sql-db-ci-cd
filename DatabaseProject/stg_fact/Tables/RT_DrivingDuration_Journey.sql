CREATE TABLE [stg_fact].[RT_DrivingDuration_Journey] (
    [JourneyRef]                  CHAR (18) NULL,
    [DateKey]                     INT       NULL,
    [TimeKey]                     INT       NULL,
    [OperatingDayTypeKey]         INT       NULL,
    [StrategicNetKey]             INT       NULL,
    [JourneyPatternKey]           INT       NULL,
    [OutlierClassificationKey]    INT       NULL,
    [ContractorKey]               INT       NULL,
    [ContractKey]                 INT       NULL,
    [IsPlanned]                   TINYINT   NULL,
    [IsObserved]                  TINYINT   NULL,
    [PlannedDurationSeconds]      INT       NULL,
    [ObservedDurationSeconds]     INT       NULL,
    [DifferenceInDurationSeconds] INT       NULL,
    [Is2MinDelayed]               INT       NULL,
    [Is3MinDelayed]               INT       NULL,
    [Is5MinDelayed]               INT       NULL,
    [K2DelayedSeconds]            INT       NULL,
    [K3DelayedSeconds]            INT       NULL,
    [K5DelayedSeconds]            INT       NULL
);


GO

