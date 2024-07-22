CREATE TABLE [data].[ACCT_Settlement_PTVehicleJourneyAssignment_Monthly] (
    [SourceSystemCode]     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (50) NOT NULL,
    [JourneyRef]           CHAR (18)     NOT NULL,
    [VehicleNumber]        INT           NOT NULL,
    [AssignmentType]       TINYINT       NULL,
    [AssignedFromDateTime] DATETIME2 (3) NULL,
    [AssignedToDateTime]   DATETIME2 (3) NULL,
    [AssignedTime]         INT           NULL,
    [Hash]                 BINARY (32)   NULL,
    [Inserted]             DATETIME2 (7) NULL,
    [Updated]              DATETIME2 (7) NULL,
    CONSTRAINT [PK_ACCT_Settlement_PTVehicleJourneyAssignment_Monthly] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

