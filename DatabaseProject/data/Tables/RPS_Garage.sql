CREATE TABLE [data].[RPS_Garage] (
    [VehicleId]     INT           NOT NULL,
    [Group]         INT           NULL,
    [FromTime]      DATETIME2 (7) NOT NULL,
    [ToTime]        DATETIME2 (7) NOT NULL,
    [AvgLatitude]   FLOAT (53)    NULL,
    [AvgLongitude]  FLOAT (53)    NULL,
    [DiffInMinutes] INT           NULL,
    [Contractor]    VARCHAR (50)  NOT NULL,
    [GarageCode]    VARCHAR (50)  NOT NULL,
    [Hash]          BINARY (32)   NULL,
    [Inserted]      DATETIME2 (7) NULL,
    [Updated]       DATETIME2 (7) NULL,
    CONSTRAINT [PK_RPS_Garage_1] PRIMARY KEY CLUSTERED ([VehicleId] ASC, [FromTime] ASC, [ToTime] ASC, [Contractor] ASC, [GarageCode] ASC)
);


GO

