CREATE TABLE [stg].[ACCT_Settlement_MatchVehicleJourneyAssignment_Daily] (
    [JourneyRef]              CHAR (18)     NULL,
    [VehicleId]               INT           NULL,
    [DeviceId]                BINARY (8)    NULL,
    [DurationSeconds]         INT           NULL,
    [TotalReportCount]        INT           NULL,
    [FaultyReportCount]       INT           NULL,
    [ObservedCoverageSeconds] INT           NULL,
    [Rank]                    BIGINT        NULL,
    [ObservedCoverage]        FLOAT (53)    NULL,
    [SourceSystemCode]        NVARCHAR (20) NULL
);


GO

