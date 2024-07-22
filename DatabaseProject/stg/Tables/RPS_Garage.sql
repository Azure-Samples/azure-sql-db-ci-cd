CREATE TABLE [stg].[RPS_Garage] (
    [VehicleId]     INT           NULL,
    [Group]         INT           NULL,
    [FromTime]      DATETIME2 (7) NULL,
    [ToTime]        DATETIME2 (7) NULL,
    [AvgLatitude]   FLOAT (53)    NULL,
    [AvgLongitude]  FLOAT (53)    NULL,
    [DiffInMinutes] INT           NULL,
    [Contractor]    VARCHAR (50)  NULL,
    [GarageCode]    VARCHAR (50)  NULL
);


GO

