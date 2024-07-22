CREATE TABLE [fact].[RT_DrivingDuration_StopPoint] (
    [DrivingDurationStopPointKey]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [DateKey]                          INT             NOT NULL,
    [TimeKey]                          INT             NOT NULL,
    [OperatingDayTypeKey]              INT             CONSTRAINT [DF_RT_DrivingDuration_StopPoint_OperatingDayTypeKey] DEFAULT ((-1)) NOT NULL,
    [JourneyPatternKey]                INT             CONSTRAINT [DF_RT_DrivingDuration_StopPoint_JourneyPatternKey] DEFAULT ((-1)) NOT NULL,
    [JourneyPatternSectionKey]         INT             CONSTRAINT [DF_RT_DrivingDuration_StopPoint_JourneyPatternSectionKey] DEFAULT ((-1)) NOT NULL,
    [SourceSystemCode]                 NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryId]              NVARCHAR (22)   NOT NULL,
    [PlannedStopPointStopSeconds]      SMALLINT        NULL,
    [PlannedStopPointDurationSeconds]  SMALLINT        NULL,
    [PlannedStopPointDistanceMeters]   DECIMAL (10, 2) NULL,
    [ObservedStopPointStopSeconds]     SMALLINT        NULL,
    [ObservedStopPointDurationSeconds] SMALLINT        NULL,
    [ObservedStopPointDistanceMeters]  DECIMAL (10, 2) NULL,
    [ContractorKey]                    INT             CONSTRAINT [DF_RT_DrivingDuration_StopPoint_ContractorKey] DEFAULT ((-1)) NOT NULL,
    [IsObserved]                       BIT             NULL,
    [TimingPointSectionTimeKey]        INT             CONSTRAINT [DF_RT_DrivingDuration_StopPoint_TimingPointSectionTimeKey] DEFAULT ((-1)) NOT NULL,
    [TimeOperatingDayTypekey]          INT             NULL,
    [StrategicNetKey]                  INT             NULL,
    [OutlierClassificationKey]         INT             NULL,
    [PlannedStartTimeKey]              INT             NULL,
    CONSTRAINT [PK_RT_DrivingDuration_StopPoint] PRIMARY KEY CLUSTERED ([DrivingDurationStopPointKey] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_DrivingDuration_StopPoint]
    ON [fact].[RT_DrivingDuration_StopPoint]([DateKey] ASC, [OperatingDayTypeKey] ASC, [JourneyPatternKey] ASC, [JourneyPatternSectionKey] ASC, [ObservedStopPointDurationSeconds] ASC, [TimingPointSectionTimeKey] ASC, [PlannedStopPointDistanceMeters] ASC, [ObservedStopPointStopSeconds] ASC);


GO

CREATE COLUMNSTORE INDEX [CSIX_RT_DrivingDuration_StopPoint]
    ON [fact].[RT_DrivingDuration_StopPoint]([DrivingDurationStopPointKey], [DateKey], [TimeKey], [OperatingDayTypeKey], [JourneyPatternKey], [JourneyPatternSectionKey], [PlannedStopPointStopSeconds], [PlannedStopPointDurationSeconds], [PlannedStopPointDistanceMeters], [ObservedStopPointStopSeconds], [ObservedStopPointDurationSeconds], [ObservedStopPointDistanceMeters], [ContractorKey], [IsObserved], [TimingPointSectionTimeKey]);


GO

