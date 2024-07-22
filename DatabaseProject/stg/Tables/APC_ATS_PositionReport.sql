CREATE TABLE [stg].[APC_ATS_PositionReport] (
    [DateTime]                    DATETIME2 (3) NULL,
    [VehicleRef]                  NVARCHAR (32) NULL,
    [VehicleIdentificationNumber] NVARCHAR (32) NULL,
    [SequenceNumber]              BIGINT        NULL,
    [Latitude]                    FLOAT (53)    NULL,
    [Longitude]                   FLOAT (53)    NULL,
    [Bearing]                     FLOAT (53)    NULL,
    [GpsHdop]                     FLOAT (53)    NULL,
    [ReceivedDateTime]            DATETIME2 (3) NULL,
    [ApiKeyOwner]                 NVARCHAR (32) NULL,
    [LagTime]                     INT           NULL,
    [LagDistance]                 FLOAT (53)    NULL
);


GO

