CREATE TABLE [data].[APC_ATS_DailyVehicleBalance] (
    [Date]                       DATE          NOT NULL,
    [VehicleRef]                 NVARCHAR (32) NOT NULL,
    [DailyVehicleBoardingCount]  INT           NOT NULL,
    [DailyVehicleAlightingCount] INT           NOT NULL,
    [DailyVehicleBalance]        FLOAT (53)    NULL,
    CONSTRAINT [PK_APC_ATS_DailyVehicleBalance] PRIMARY KEY CLUSTERED ([Date] ASC, [VehicleRef] ASC)
);


GO

