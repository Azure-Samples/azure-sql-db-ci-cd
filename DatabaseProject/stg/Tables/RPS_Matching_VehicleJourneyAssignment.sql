CREATE TABLE [stg].[RPS_Matching_VehicleJourneyAssignment] (
    [VehicleId]               INT              NOT NULL,
    [DeviceId]                BINARY (8)       NOT NULL,
    [FromDateTimeUtc]         DATETIME2 (3)    NULL,
    [ToDateTimeUtc]           DATETIME2 (3)    NULL,
    [ServiceJourneyId]        NVARCHAR (20)    NULL,
    [NoGpsFixCount]           INT              NULL,
    [LowGpsQualityCount]      INT              NULL,
    [RepeatedPositionCount]   INT              NULL,
    [TotalPositionCount]      INT              NULL,
    [ObservedCoverageSeconds] INT              NULL,
    [ObservedCoverage]        NUMERIC (28, 17) NULL,
    [JourneyRef]              CHAR (18)        NULL,
    [MatchType]               TINYINT          NULL,
    [MatchTimestamp]          DATETIME2 (3)    NULL
);


GO

