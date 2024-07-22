CREATE TABLE [stg].[RPS_PositionMessage] (
    [SendDateTime]     DATETIME2 (3)  NULL,
    [ReceivedDateTime] DATETIME2 (3)  NULL,
    [Priority]         TINYINT        NULL,
    [UnitIdentity]     BINARY (8)     NULL,
    [SequenceNumber]   INT            NULL,
    [Timestamp]        BIGINT         NULL,
    [Latitude]         REAL           NULL,
    [Longitude]        REAL           NULL,
    [Speed]            NUMERIC (5, 2) NULL,
    [Direction]        NUMERIC (5, 2) NULL,
    [GpsFixType]       TINYINT        NULL,
    [GpsQuality]       TINYINT        NULL,
    [InService]        TINYINT        NULL,
    [StopRequested]    TINYINT        NULL,
    [DoorReleased]     TINYINT        NULL,
    [PowerOn]          TINYINT        NULL,
    [Distance]         NUMERIC (10)   NULL,
    [VehicleId]        NVARCHAR (255) NULL,
    [ServiceJourneyId] NVARCHAR (255) NULL
);


GO

