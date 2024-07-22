CREATE TABLE [data].[RPS_Matching_VehicleJourneyAssignment] (
    [VehicleId]               INT              NOT NULL,
    [DeviceId]                BINARY (8)       NOT NULL,
    [FromDateTimeUtc]         DATETIME2 (3)    NOT NULL,
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
    [MatchTimestamp]          DATETIME2 (3)    NULL,
    CONSTRAINT [PK_RPS_Matching_VehicleJourneyAssignment] PRIMARY KEY CLUSTERED ([VehicleId] ASC, [DeviceId] ASC, [FromDateTimeUtc] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RPS_Matching_VehicleJourneyAssignment_JourneyRef]
    ON [data].[RPS_Matching_VehicleJourneyAssignment]([JourneyRef] ASC)
    INCLUDE([FromDateTimeUtc], [ToDateTimeUtc], [MatchType], [MatchTimestamp]);


GO

