CREATE TABLE [data].[APC_ATS_DailyVehicleLocationQuality] (
    [Date]            DATE          NOT NULL,
    [VehicleRef]      NVARCHAR (32) NOT NULL,
    [PositionCount]   INT           NOT NULL,
    [MessageAccuracy] FLOAT (53)    NULL,
    [HdopAccuracy]    FLOAT (53)    NULL,
    [SpeedAccuracy]   FLOAT (53)    NULL,
    CONSTRAINT [PK_APC_ATS_DailyVehicleLocationQuality] PRIMARY KEY CLUSTERED ([Date] ASC, [VehicleRef] ASC)
);


GO

