CREATE TABLE [fact].[RT_DrivingDuration_TimingPoint] (
    [JourneyPointRef]                          NVARCHAR (22)   NOT NULL,
    [DateKey]                                  INT             NOT NULL,
    [OperatingDayTypeKey]                      INT             NOT NULL,
    [ContractorKey]                            INT             NOT NULL,
    [ContractKey]                              INT             NOT NULL,
    [StrategicNetKey]                          INT             NOT NULL,
    [JourneyPatternKey]                        INT             NOT NULL,
    [JourneyPatternSectionKey]                 INT             NOT NULL,
    [JourneyPlannedStartTimeKey]               INT             NOT NULL,
    [TimingPointLinkKey]                       INT             NOT NULL,
    [TimeKey]                                  INT             NOT NULL,
    [OutlierClassificationKey]                 INT             NOT NULL,
    [IsLastStop]                               TINYINT         NULL,
    [PlannedTimingPointDwellSeconds]           INT             NULL,
    [PlannedTimingPointLinkTravelTimeSeconds]  INT             NULL,
    [PlannedStopPointDistanceMeters]           DECIMAL (11, 2) NULL,
    [ObservedTimingPointDwellSeconds]          INT             NULL,
    [ObservedTimingPointLinkTravelTimeSeconds] INT             NULL,
    [Inserted]                                 DATETIME2 (0)   NULL,
    [Updated]                                  DATETIME2 (0)   NULL,
    CONSTRAINT [PK_RT_DrivingDuration_TimingPoint] PRIMARY KEY CLUSTERED ([JourneyPointRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_DrivingDuration_TimingPoint_DateKey]
    ON [fact].[RT_DrivingDuration_TimingPoint]([DateKey] ASC)
    INCLUDE([JourneyPointRef], [OperatingDayTypeKey], [ContractorKey], [ContractKey], [StrategicNetKey], [JourneyPatternKey], [JourneyPatternSectionKey], [JourneyPlannedStartTimeKey], [TimingPointLinkKey], [TimeKey], [OutlierClassificationKey], [IsLastStop], [PlannedTimingPointDwellSeconds], [PlannedTimingPointLinkTravelTimeSeconds], [PlannedStopPointDistanceMeters], [ObservedTimingPointDwellSeconds], [ObservedTimingPointLinkTravelTimeSeconds], [Inserted], [Updated]);


GO

CREATE COLUMNSTORE INDEX [CSIX_RT_DrivingDuration_TimingPoint]
    ON [fact].[RT_DrivingDuration_TimingPoint]([OutlierClassificationKey], [IsLastStop], [StrategicNetKey], [JourneyPatternKey], [JourneyPatternSectionKey], [JourneyPlannedStartTimeKey], [ContractKey], [TimingPointLinkKey], [TimeKey], [JourneyPointRef], [DateKey], [OperatingDayTypeKey], [ContractorKey]);


GO

