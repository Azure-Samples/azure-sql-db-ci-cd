CREATE TABLE [data].[RT_JourneyPoint] (
    [JourneyPointRef]                     CHAR (22)       NOT NULL,
    [JourneyRef]                          CHAR (18)       NOT NULL,
    [SourceSystemCode]                    NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]                NVARCHAR (22)   NULL,
    [OperatingDayDate]                    DATE            NULL,
    [LineNumber]                          NUMERIC (4)     NULL,
    [LineDirectionCode]                   NCHAR (1)       NULL,
    [JourneyNumber]                       NUMERIC (4)     NULL,
    [SequenceNumber]                      SMALLINT        NULL,
    [JourneyPatternPointGid]              BIGINT          NULL,
    [IsStopPoint]                         BIT             NULL,
    [StopPointId]                         INT             NULL,
    [StopPointOwner]                      INT             NULL,
    [StopPointNumber]                     INT             NULL,
    [StopPointSequenceNumber]             SMALLINT        NULL,
    [IsTimingPoint]                       BIT             NULL,
    [TimingPointSequenceNumber]           SMALLINT        NULL,
    [ArrivalType]                         TINYINT         NULL,
    [DepartureType]                       TINYINT         NULL,
    [PlannedJourneyDistanceMeters]        DECIMAL (10, 2) NULL,
    [PlannedArrivalDateTime]              DATETIME2 (0)   NULL,
    [PlannedDepartureDateTime]            DATETIME2 (0)   NULL,
    [PlannedLineDirectionHeadwaySeconds]  INT             NULL,
    [ObservedJourneyDistanceMeters]       DECIMAL (10, 2) NULL,
    [ObservedArrivalDateTime]             DATETIME2 (0)   NULL,
    [ObservedDepartureDateTime]           DATETIME2 (0)   NULL,
    [ObservedLineDirectionHeadwaySeconds] INT             NULL,
    [ObservedVehicleId]                   NUMERIC (5)     NULL,
    [EstimatedArrivalDateTimeFinal]       DATETIME2 (0)   NULL,
    [EstimatedDepartureDateTimeFinal]     DATETIME2 (0)   NULL,
    [TargetArrivalDateTimeFinal]          DATETIME2 (0)   NULL,
    [TargetDepartureDateTimeFinal]        DATETIME2 (0)   NULL,
    [ArrivalStateFinal]                   TINYINT         NULL,
    [DepartureStateFinal]                 TINYINT         NULL,
    [TotalCheckInCount]                   SMALLINT        NULL,
    [TotalCheckOutCount]                  SMALLINT        NULL,
    [TotalCashTicketCount]                SMALLINT        NULL,
    [TotalCashTicketAmount]               INT             NULL,
    [IsCanceled]                          BIT             NULL,
    [CancelCauseCode]                     NVARCHAR (20)   NULL,
    [OutlierClassification]               TINYINT         NULL,
    [EarliestCheckInTime]                 DATETIME2 (0)   NULL,
    [LatestCheckInTime]                   DATETIME2 (0)   NULL,
    [Hash]                                BINARY (32)     NULL,
    [Inserted]                            DATETIME2 (7)   NULL,
    [Updated]                             DATETIME2 (7)   NULL,
    CONSTRAINT [PK_RT_JourneyPoint] PRIMARY KEY CLUSTERED ([JourneyPointRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_JourneyPoint_OperatingDayDate]
    ON [data].[RT_JourneyPoint]([OperatingDayDate] ASC)
    INCLUDE([JourneyPointRef], [JourneyRef], [LineNumber], [JourneyNumber], [LineDirectionCode], [SequenceNumber], [StopPointId], [IsStopPoint], [IsTimingPoint], [IsCanceled], [JourneyPatternPointGid], [ArrivalType], [DepartureType], [ObservedVehicleId], [ObservedArrivalDateTime], [ObservedDepartureDateTime], [ObservedJourneyDistanceMeters], [ObservedLineDirectionHeadwaySeconds], [PlannedArrivalDateTime], [PlannedDepartureDateTime], [PlannedJourneyDistanceMeters], [PlannedLineDirectionHeadwaySeconds], [TotalCashTicketCount], [TotalCheckInCount], [OutlierClassification]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_JourneyPoint_StoppointOperatingDayDate]
    ON [data].[RT_JourneyPoint]([StopPointNumber] ASC, [OperatingDayDate] ASC)
    INCLUDE([ObservedArrivalDateTime], [ObservedVehicleId]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_JourneyPoint_JourneyRef]
    ON [data].[RT_JourneyPoint]([JourneyRef] ASC)
    INCLUDE([JourneyPointRef], [OperatingDayDate], [LineNumber], [JourneyNumber], [LineDirectionCode], [SequenceNumber], [StopPointId], [IsStopPoint], [IsTimingPoint], [IsCanceled], [JourneyPatternPointGid], [ArrivalType], [DepartureType], [ObservedVehicleId], [ObservedArrivalDateTime], [ObservedDepartureDateTime], [ObservedJourneyDistanceMeters], [ObservedLineDirectionHeadwaySeconds], [PlannedArrivalDateTime], [PlannedDepartureDateTime], [PlannedJourneyDistanceMeters], [PlannedLineDirectionHeadwaySeconds], [TotalCashTicketCount], [TotalCheckInCount], [OutlierClassification]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_JourneyPoint_JourneyRefIsCanceled]
    ON [data].[RT_JourneyPoint]([JourneyRef] ASC, [IsCanceled] ASC, [OperatingDayDate] ASC, [SequenceNumber] ASC)
    INCLUDE([StopPointId]);


GO

