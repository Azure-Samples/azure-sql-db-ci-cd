CREATE TABLE [stg].[ACCT_Settlement_PTVehicleJourneyAssignment_Daily] (
    [SourceSystemCode]     NVARCHAR (20) NULL,
    [SourceSystemEntryRef] NVARCHAR (50) NULL,
    [JourneyRef]           CHAR (18)     NOT NULL,
    [VehicleNumber]        INT           NULL,
    [AssignmentType]       TINYINT       NOT NULL,
    [AssignedFromDateTime] DATETIME2 (3) NULL,
    [AssignedToDateTime]   DATETIME2 (3) NULL,
    [AssignedTime]         INT           NULL
);


GO

