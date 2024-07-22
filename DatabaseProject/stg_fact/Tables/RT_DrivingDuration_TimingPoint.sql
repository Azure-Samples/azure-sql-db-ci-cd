CREATE TABLE [stg_fact].[RT_DrivingDuration_TimingPoint] (
    [JourneyPointRef]                          NVARCHAR (22)   NULL,
    [DateKey]                                  INT             NULL,
    [OperatingDayTypeKey]                      INT             NULL,
    [ContractorKey]                            INT             NULL,
    [ContractKey]                              INT             NULL,
    [StrategicNetKey]                          INT             NULL,
    [JourneyPatternKey]                        INT             NULL,
    [JourneyPatternSectionKey]                 INT             NULL,
    [JourneyPlannedStartTimeKey]               INT             NULL,
    [TimingPointLinkKey]                       INT             NULL,
    [TimeKey]                                  INT             NULL,
    [OutlierClassificationKey]                 INT             NULL,
    [IsLastStop]                               TINYINT         NULL,
    [PlannedTimingPointDwellSeconds]           INT             NULL,
    [PlannedTimingPointLinkTravelTimeSeconds]  INT             NULL,
    [PlannedStopPointDistanceMeters]           DECIMAL (11, 2) NULL,
    [ObservedTimingPointDwellSeconds]          INT             NULL,
    [ObservedTimingPointLinkTravelTimeSeconds] INT             NULL,
    [JourneyPatternId]                         BIGINT          NULL,
    [OperatingDayDate]                         DATE            NULL,
    [OperatingDayType]                         INT             NULL,
    [PlannedDepartureDateTime]                 TIME (0)        NULL,
    [ContractorCode]                           NVARCHAR (10)   NULL,
    [ContractCode]                             NVARCHAR (10)   NULL,
    [LineNumber]                               INT             NULL,
    [SequenceNumber]                           INT             NULL,
    [StrategicNetCode]                         NVARCHAR (10)   NULL,
    [PlannedStartDateTime]                     TIME (0)        NULL,
    [OutlierClassificationSum]                 INT             NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_DrivingDuration_TimingPoint_JourneyPointRef]
    ON [stg_fact].[RT_DrivingDuration_TimingPoint]([JourneyPointRef] ASC)
    INCLUDE([DateKey], [OperatingDayTypeKey], [ContractorKey], [ContractKey], [StrategicNetKey], [JourneyPatternKey], [JourneyPatternSectionKey], [JourneyPlannedStartTimeKey], [TimingPointLinkKey], [TimeKey], [OutlierClassificationKey], [IsLastStop], [PlannedTimingPointDwellSeconds], [PlannedTimingPointLinkTravelTimeSeconds], [PlannedStopPointDistanceMeters], [ObservedTimingPointDwellSeconds], [ObservedTimingPointLinkTravelTimeSeconds], [JourneyPatternId], [OperatingDayDate], [OperatingDayType], [PlannedDepartureDateTime], [ContractorCode], [ContractCode], [LineNumber], [SequenceNumber], [StrategicNetCode], [PlannedStartDateTime], [OutlierClassificationSum]);


GO

