CREATE TABLE [stg].[EXPORT_JourneyCorrection_VehiclePosition] (
    [VehicleId]    INT           NOT NULL,
    [DeviceId]     BINARY (8)    NOT NULL,
    [SendDateTime] DATETIME2 (3) NOT NULL,
    [Latitude]     REAL          NOT NULL,
    [Longitude]    REAL          NOT NULL,
    [VehicleRef]   NVARCHAR (8)  NULL,
    [JourneyRef]   NVARCHAR (25) NULL
);


GO

