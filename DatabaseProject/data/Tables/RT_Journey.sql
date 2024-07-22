CREATE TABLE [data].[RT_Journey] (
    [JourneyRef]                             CHAR (18)       NOT NULL,
    [SourceSystemCode]                       NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]                   BIGINT          NOT NULL,
    [OperatingDayDate]                       DATE            NOT NULL,
    [OperatingDayType]                       TINYINT         NULL,
    [LineNumber]                             NUMERIC (4)     NOT NULL,
    [LineDesignation]                        VARCHAR (8)     NOT NULL,
    [LineDirectionCode]                      NCHAR (1)       NULL,
    [JourneyNumber]                          DECIMAL (6)     NOT NULL,
    [JourneyPatternId]                       NUMERIC (16)    NOT NULL,
    [TimedJourneyPatternId]                  BIGINT          NULL,
    [TransportModeCode]                      NVARCHAR (20)   NULL,
    [ContractCode]                           NVARCHAR (20)   NULL,
    [ContractorCode]                         NVARCHAR (20)   NULL,
    [ContractorGarageCode]                   NVARCHAR (20)   NULL,
    [PlannedStartDateTime]                   DATETIME        NOT NULL,
    [PlannedEndDateTime]                     DATETIME        NOT NULL,
    [PlannedStopCount]                       SMALLINT        NULL,
    [PlannedPaidDurationSeconds]             INT             NOT NULL,
    [PlannedPaidDistanceMeters]              DECIMAL (12, 2) NULL,
    [DatedVehicleJourneyId]                  NUMERIC (16)    NOT NULL,
    [DatedVehicleJourneyGid]                 NUMERIC (16)    NOT NULL,
    [IsExpectedByHistory]                    BIT             NULL,
    [IsReplaced]                             BIT             NOT NULL,
    [HasCancellation]                        BIT             NULL,
    [HasInconsistentObservation]             BIT             NULL,
    [ObservedStartDateTime]                  DATETIME        NULL,
    [ObservedEndDateTime]                    DATETIME        NULL,
    [VehicleSourceSystemCode]                NVARCHAR (20)   NULL,
    [PrimaryVehicleAssignmentType]           TINYINT         NULL,
    [PrimaryVehicleGid]                      NUMERIC (16)    NULL,
    [PrimaryVehicleNumber]                   NUMERIC (5)     NULL,
    [PrimaryVehicleAssignedFromDateTime]     DATETIME        NULL,
    [PrimaryVehicleAssignedToDateTime]       DATETIME        NULL,
    [PrimaryVehicleSeconds]                  INT             NULL,
    [TotalVehicleCount]                      TINYINT         NULL,
    [TotalVehicleSeconds]                    INT             NULL,
    [ExpectedArrivalCount]                   TINYINT         NULL,
    [ObservedArrivalCount]                   TINYINT         NULL,
    [ExpectedDepartureCount]                 TINYINT         NULL,
    [EstimatedDepartureCount]                SMALLINT        NULL,
    [ObservedDepartureCount]                 SMALLINT        NULL,
    [PrimaryShiftNumber]                     INT             NULL,
    [PrimaryStaffNumber]                     INT             NULL,
    [PrimaryDeviceId]                        INT             NULL,
    [TotalCheckInCount]                      SMALLINT        NULL,
    [TotalCheckOutCount]                     SMALLINT        NULL,
    [TotalCashTicketCount]                   SMALLINT        NULL,
    [TotalCashTicketAmount]                  INT             NULL,
    [TrackingSourceSystemCode]               NVARCHAR (20)   NULL,
    [PrimaryTrackingFaultyReportCount]       INT             NULL,
    [PrimaryTrackingTotalReportCount]        INT             NULL,
    [PrimaryTrackingObservedCoverageSeconds] INT             NULL,
    [PrimaryTrackingObservedCoverage]        FLOAT (53)      NULL,
    [OutlierClassification]                  TINYINT         NULL,
    [Inserted]                               DATETIME2 (0)   NULL,
    [Updated]                                DATETIME2 (0)   NULL,
    CONSTRAINT [PK_RT_Journey] PRIMARY KEY CLUSTERED ([JourneyRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_Journey_OperatingDayDate_DatedVehicleJourneyGid]
    ON [data].[RT_Journey]([OperatingDayDate] ASC, [DatedVehicleJourneyGid] ASC)
    INCLUDE([JourneyRef], [PlannedStartDateTime], [PlannedEndDateTime]);


GO

CREATE NONCLUSTERED INDEX [IX_RT_Journey_JourneyPatternId]
    ON [data].[RT_Journey]([JourneyPatternId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_RT_Journey_OperatingDayDate]
    ON [data].[RT_Journey]([OperatingDayDate] ASC)
    INCLUDE([JourneyRef], [SourceSystemCode], [SourceSystemEntryRef], [OperatingDayType], [LineNumber], [LineDesignation], [LineDirectionCode], [JourneyNumber], [JourneyPatternId], [TimedJourneyPatternId], [PlannedStartDateTime], [PlannedEndDateTime], [ObservedEndDateTime], [ObservedStartDateTime], [TransportModeCode], [ContractCode], [ContractorCode], [ContractorGarageCode], [DatedVehicleJourneyId], [DatedVehicleJourneyGid], [PrimaryVehicleNumber], [HasInconsistentObservation], [OutlierClassification]);


GO

