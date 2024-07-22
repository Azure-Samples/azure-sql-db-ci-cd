CREATE TABLE [stg_fact].[RPS_Operational_JourneyAssignment] (
    [JourneyRef]                           CHAR (18)     NULL,
    [LineKey]                              INT           NULL,
    [JourneyPatternKey]                    INT           NULL,
    [ContractorKey]                        INT           NULL,
    [ContractorGarageKey]                  INT           NULL,
    [ContractKey]                          INT           NULL,
    [DateKey]                              INT           NULL,
    [Date]                                 DATE          NULL,
    [LineNumber]                           NUMERIC (4)   NULL,
    [JourneyNumber]                        NUMERIC (6)   NULL,
    [PlannedStartDateTime]                 DATETIME2 (0) NULL,
    [JourneyPatternId]                     NUMERIC (16)  NULL,
    [ContractorCode]                       NVARCHAR (20) NULL,
    [ContractorGarageCode]                 NVARCHAR (20) NULL,
    [ContractCode]                         NVARCHAR (20) NULL,
    [PrimaryVehicleNumber]                 NUMERIC (5)   NULL,
    [PrimaryStaffNumber]                   INT           NULL,
    [PrimaryVehicleAssignmentType]         TINYINT       NULL,
    [PlannedPaidDurationSeconds]           INT           NULL,
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

