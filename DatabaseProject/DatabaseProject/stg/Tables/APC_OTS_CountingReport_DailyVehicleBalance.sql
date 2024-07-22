CREATE TABLE [stg].[APC_OTS_CountingReport_DailyVehicleBalance] (
    [Date]                       DATE          NULL,
    [VehicleRef]                 NVARCHAR (32) NULL,
    [DailyVehicleBoardingCount]  INT           NULL,
    [DailyVehicleAlightingCount] INT           NULL,
    [DailyVehicleBalance]        FLOAT (53)    NULL
);


GO

