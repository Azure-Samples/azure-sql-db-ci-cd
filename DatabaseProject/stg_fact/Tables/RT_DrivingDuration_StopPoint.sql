CREATE TABLE [stg_fact].[RT_DrivingDuration_StopPoint] (
    [DrivingDurationStopPointKey]      BIGINT          NULL,
    [DateKey]                          INT             NULL,
    [TimeKey]                          INT             NULL,
    [OperatingDayTypeKey]              INT             NULL,
    [TimeOperatingDayTypeKey]          INT             NULL,
    [JourneyPatternKey]                INT             NULL,
    [JourneyPatternSectionKey]         INT             NULL,
    [ContractorKey]                    INT             NULL,
    [StrategicNetKey]                  INT             NULL,
    [OutlierClassificationKey]         INT             NULL,
    [SourceSystemCode]                 NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryId]              NVARCHAR (22)   NOT NULL,
    [PlannedStopPointStopSeconds]      SMALLINT        NULL,
    [PlannedStopPointDurationSeconds]  SMALLINT        NULL,
    [PlannedStopPointDistanceMeters]   DECIMAL (10, 2) NULL,
    [ObservedStopPointStopSeconds]     SMALLINT        NULL,
    [ObservedStopPointDurationSeconds] SMALLINT        NULL,
    [ObservedStopPointDistanceMeters]  DECIMAL (10, 2) NULL,
    [OperatingDayDate]                 DATE            NULL,
    [OperatingDayType]                 TINYINT         NULL,
    [LineNumber]                       INT             NULL,
    [ContractorCode]                   NVARCHAR (20)   NULL,
    [PlannedDepartureDateTime]         DATETIME        NULL,
    [IsObserved]                       BIT             NULL,
    [TimingPointSectionTimeKey]        INT             CONSTRAINT [DF_RT_DrivingDuration_StopPoint_TimingPointSectionTimeKey_1] DEFAULT ((-1)) NOT NULL,
    [DatedVehicleJourneyId]            BIGINT          NULL,
    [JourneyPatternId]                 NUMERIC (16)    NULL,
    [SequenceNumber]                   SMALLINT        NULL,
    [IsTimingPoint]                    BIT             NULL,
    [TimingPointSequenceNumber]        SMALLINT        NULL,
    [OutlierClassification]            TINYINT         NULL,
    [PlannedStartDateTime]             DATETIME        NULL,
    [PlannedStartTimeKey]              INT             NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RT_DrivingDuration_StopPoint]
    ON [stg_fact].[RT_DrivingDuration_StopPoint]([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
    INCLUDE([DateKey], [TimeKey], [OperatingDayTypeKey], [TimeOperatingDayTypeKey], [ContractorKey], [JourneyPatternKey], [JourneyPatternSectionKey], [TimingPointSectionTimeKey], [StrategicNetKey], [OutlierClassificationKey], [PlannedStopPointStopSeconds], [PlannedStopPointDurationSeconds], [PlannedStopPointDistanceMeters], [ObservedStopPointStopSeconds], [ObservedStopPointDurationSeconds], [ObservedStopPointDistanceMeters], [IsObserved]);


GO

