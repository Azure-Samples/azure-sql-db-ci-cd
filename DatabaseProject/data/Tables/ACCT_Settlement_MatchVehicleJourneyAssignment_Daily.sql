CREATE TABLE [data].[ACCT_Settlement_MatchVehicleJourneyAssignment_Daily] (
    [SourceSystemCode]        NVARCHAR (20) NULL,
    [JourneyRef]              CHAR (18)     NOT NULL,
    [VehicleId]               INT           NOT NULL,
    [DeviceId]                BINARY (8)    NOT NULL,
    [DurationSeconds]         INT           NULL,
    [TotalReportCount]        INT           NULL,
    [FaultyReportCount]       INT           NULL,
    [ObservedCoverageSeconds] INT           NULL,
    [Rank]                    BIGINT        NOT NULL,
    [ObservedCoverage]        FLOAT (53)    NULL,
    [Hash]                    BINARY (32)   NULL,
    [Inserted]                DATETIME2 (7) NULL,
    [Updated]                 DATETIME2 (7) NULL,
    CONSTRAINT [PK_ACCT_Settlement_MatchVehicleJourneyAssignment_Daily] PRIMARY KEY CLUSTERED ([JourneyRef] ASC, [VehicleId] ASC, [DeviceId] ASC, [Rank] ASC)
);


GO

