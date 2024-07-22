CREATE TABLE [stg].[ACCT_Settlement_MatchVehicleJourneyAssignment_Monthly] (
    [JourneyRef]              CHAR (18)     NULL,
    [VehicleId]               INT           NOT NULL,
    [DeviceId]                BINARY (8)    NOT NULL,
    [DurationSeconds]         INT           NULL,
    [TotalReportCount]        INT           NULL,
    [FaultyReportCount]       INT           NULL,
    [ObservedCoverageSeconds] INT           NULL,
    [Rank]                    BIGINT        NULL,
    [ObservedCoverage]        FLOAT (53)    NULL,
    [SourceSystemCode]        NVARCHAR (20) NULL
);


GO

