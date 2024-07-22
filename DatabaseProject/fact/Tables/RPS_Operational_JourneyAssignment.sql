CREATE TABLE [fact].[RPS_Operational_JourneyAssignment] (
    [JourneyRef]                           CHAR (18)     NOT NULL,
    [LineKey]                              INT           NOT NULL,
    [JourneyPatternKey]                    INT           NOT NULL,
    [ContractorKey]                        INT           NOT NULL,
    [ContractorGarageKey]                  INT           NOT NULL,
    [ContractKey]                          INT           NOT NULL,
    [DateKey]                              INT           NOT NULL,
    [JourneyNumber]                        NUMERIC (6)   NOT NULL,
    [PlannedStartDateTime]                 DATETIME2 (0) NULL,
    [PrimaryVehicleNumber]                 NUMERIC (5)   NULL,
    [PrimaryStaffNumber]                   INT           NULL,
    [PrimaryVehicleAssignmentType]         TINYINT       NULL,
    [PlannedPaidDurationSeconds]           INT           NOT NULL,
    [PrimaryVehicleSeconds]                INT           NULL,
    [ObservedManualAssignmentSeconds]      INT           NULL,
    [IsSignificantlyAssigned]              INT           NULL,
    [PrimaryTrackingObservedCoverage]      REAL          NULL,
    [PrimaryTrackingObservedQuality]       REAL          NULL,
    [PlannedPaidDurationText]              NVARCHAR (10) NULL,
    [PrimaryVehicleDurationText]           NVARCHAR (10) NULL,
    [ObservedManualAssignmentDurationText] NVARCHAR (10) NULL,
    [PrimaryVehicleNumberRegistered]       INT           NULL,
    [PrimaryStaffNumberRegistered]         INT           NULL,
    [VehicleSourceSystemCode]              NVARCHAR (20) NULL,
    [JourneyAssignment]                    INT           NULL,
    [HourKey]                              INT           NULL
);


GO

CREATE NONCLUSTERED INDEX [IX_DateKey]
    ON [fact].[RPS_Operational_JourneyAssignment]([DateKey] ASC);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UIX_RPS_Operational_JourneyAssignment_JourneyRef]
    ON [fact].[RPS_Operational_JourneyAssignment]([JourneyRef] ASC, [PlannedStartDateTime] ASC);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RPS_Operational_JourneyAssignment]
    ON [fact].[RPS_Operational_JourneyAssignment];


GO

