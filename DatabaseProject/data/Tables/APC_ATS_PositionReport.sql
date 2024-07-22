CREATE TABLE [data].[APC_ATS_PositionReport] (
    [DateTime]                    DATETIME2 (3) NOT NULL,
    [VehicleRef]                  NVARCHAR (32) NOT NULL,
    [VehicleIdentificationNumber] NVARCHAR (32) NULL,
    [SequenceNumber]              BIGINT        NOT NULL,
    [Latitude]                    FLOAT (53)    NULL,
    [Longitude]                   FLOAT (53)    NULL,
    [Bearing]                     FLOAT (53)    NULL,
    [GpsHdop]                     FLOAT (53)    NULL,
    [ReceivedDateTime]            DATETIME2 (3) NULL,
    [ApiKeyOwner]                 NVARCHAR (32) NULL,
    [LagTime]                     INT           NULL,
    [LagDistance]                 FLOAT (53)    NULL,
    CONSTRAINT [PK_APC_ATS_PositionReport1] PRIMARY KEY CLUSTERED ([DateTime] ASC, [VehicleRef] ASC, [SequenceNumber] ASC)
);


GO

