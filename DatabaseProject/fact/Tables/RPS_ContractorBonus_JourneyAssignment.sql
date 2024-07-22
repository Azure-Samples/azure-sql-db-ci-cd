CREATE TABLE [fact].[RPS_ContractorBonus_JourneyAssignment] (
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
    [ObservedManualAssignmentDurationText] NVARCHAR (10) NULL
);


GO

