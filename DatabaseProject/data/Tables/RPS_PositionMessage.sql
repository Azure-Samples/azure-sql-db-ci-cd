CREATE TABLE [data].[RPS_PositionMessage] (
    [Id]               BIGINT         IDENTITY (1, 1) NOT NULL,
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
    [VehicleId]        VARCHAR (255)  NULL,
    [ServiceJourneyId] VARCHAR (255)  NULL,
    CONSTRAINT [PK_RPS_PositionMessage] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_VehicleId]
    ON [data].[RPS_PositionMessage]([VehicleId] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_SendDateTime]
    ON [data].[RPS_PositionMessage]([SendDateTime] ASC)
    INCLUDE([ReceivedDateTime], [UnitIdentity], [VehicleId], [Latitude], [Longitude], [Speed], [GpsFixType], [GpsQuality], [ServiceJourneyId]);


GO

CREATE NONCLUSTERED INDEX [IX_SendDateTime_VehicleId]
    ON [data].[RPS_PositionMessage]([SendDateTime] ASC, [VehicleId] ASC)
    INCLUDE([ReceivedDateTime], [Latitude], [Longitude], [Speed], [GpsFixType], [GpsQuality], [ServiceJourneyId]);


GO

