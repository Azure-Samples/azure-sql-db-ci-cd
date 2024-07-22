CREATE TABLE [fact].[RT_DrivingReliability_TimingPoint] (
    [DrivingReliabilityTimingPointKey] INT           IDENTITY (1, 1) NOT NULL,
    [DateKey]                          INT           NOT NULL,
    [TimeKey]                          INT           NOT NULL,
    [JourneyPlannedStartTimeKey]       INT           NULL,
    [OperatingDayTypeKey]              INT           NOT NULL,
    [ContractorKey]                    INT           NOT NULL,
    [ContractorGarageKey]              INT           NOT NULL,
    [JourneyPatternKey]                INT           NOT NULL,
    [JourneyPatternSectionKey]         INT           NOT NULL,
    [StopPointKey]                     INT           NOT NULL,
    [ReliabilityTypeKey]               INT           NOT NULL,
    [SourceSystemCode]                 NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]              NVARCHAR (22) NULL,
    [PlannedStopSeconds]               SMALLINT      NULL,
    [ObservedStopSeconds]              SMALLINT      NULL,
    [PlannedFrequencySeconds]          INT           NULL,
    [ObservedFrequencySeconds]         INT           NULL,
    [TimetableOffsetSeconds]           INT           NULL,
    [FrequencyOffsetSeconds]           INT           NULL,
    [IsReliable]                       TINYINT       NULL,
    [ContractKey]                      INT           CONSTRAINT [DF_RT_DrivingReliability_TimingPoint_ContractKey] DEFAULT ((-1)) NOT NULL,
    [OutlierClassificationKey]         INT           CONSTRAINT [DF_RT_DrivingReliability_TimingPoint_OutlierClassificationKey] DEFAULT ((-1)) NOT NULL,
    [IsFirstStopPoint]                 TINYINT       NULL,
    [IsLastStopPoint]                  TINYINT       NULL,
    [IsRingLine]                       TINYINT       NULL,
    [StrategicNetKey]                  INT           CONSTRAINT [DF_RT_DrivingReliability_TimingPoint_StrategicNetKey] DEFAULT ((-1)) NOT NULL,
    [IsBunching]                       TINYINT       NULL,
    [OperatingDayDate]                 DATE          NULL,
    [OperatingDayType]                 TINYINT       NULL,
    [ContractorCode]                   NVARCHAR (20) NULL,
    [ContractorGarageCode]             NVARCHAR (20) NULL,
    [LineNumber]                       INT           NULL,
    [LineDirectionCode]                NVARCHAR (20) NULL,
    [JourneyPatternId]                 BIGINT        NULL,
    [JourneyPlannedStartDateTime]      DATETIME2 (0) NULL,
    [StopPointOwner]                   INT           NULL,
    [StopPointNumber]                  INT           NULL,
    [PlannedDepartureDateTime]         DATETIME2 (0) NULL,
    [ObservedDepartureDateTime]        DATETIME2 (0) NULL,
    [SequenceNumber]                   SMALLINT      NULL,
    [Hour]                             TINYINT       NULL,
    [PlannedDeparturesPerHour]         TINYINT       NULL,
    [ReliabilityType]                  TINYINT       NULL,
    [ContractCode_old]                 NCHAR (10)    NULL,
    [PlannedArrivalDateTime]           DATETIME2 (0) NULL,
    [ObservedArrivalDateTime]          DATETIME2 (0) NULL,
    [StrategicNetCode]                 NVARCHAR (20) NULL,
    [OutlierClassification]            TINYINT       NULL,
    [ContractCode]                     NVARCHAR (20) NULL,
    [Inserted]                         DATETIME      NULL,
    [Updated]                          DATETIME      NULL,
    CONSTRAINT [UQ_RT_DrivingReliability_TimingPoint_SourceSystemCode_SourceSystemEntryId] UNIQUE NONCLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RT_DrivingReliability_TimingPoint]
    ON [fact].[RT_DrivingReliability_TimingPoint];


GO

