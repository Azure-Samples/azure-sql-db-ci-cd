CREATE TABLE [data].[APC_OTS_CountingReport_DailyVehicleBalance] (
    [Date]                       DATE           NOT NULL,
    [VehicleRef]                 NVARCHAR (32)  NOT NULL,
    [DailyVehicleBoardingCount]  INT            NOT NULL,
    [DailyVehicleAlightingCount] INT            NOT NULL,
    [DailyVehicleBalance]        FLOAT (53)     NULL,
    [InsertedUtc]                DATETIME2 (0)  NULL,
    [UpdatedUtc]                 DATETIME2 (0)  NULL,
    [Hash]                       VARBINARY (32) NULL,
    CONSTRAINT [PK_APC_OTS_CountingReport_DailyVehicleBalance] PRIMARY KEY CLUSTERED ([Date] ASC, [VehicleRef] ASC)
);


GO

