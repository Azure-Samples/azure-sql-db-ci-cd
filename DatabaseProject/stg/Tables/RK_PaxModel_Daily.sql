CREATE TABLE [stg].[RK_PaxModel_Daily] (
    [JourneyRef]                CHAR (18)     NOT NULL,
    [JourneyPointRef]           CHAR (22)     NOT NULL,
    [OperatingDayDate]          DATE          NULL,
    [PlannedDepartureDateTime]  DATETIME2 (3) NULL,
    [ObservedVehicleId]         INT           NULL,
    [VehicleId]                 INT           NOT NULL,
    [IsPrimaryVehicle]          BIT           NULL,
    [BoardingCount]             INT           NULL,
    [AlightingCount]            INT           NULL,
    [InVehicleCount]            INT           NULL,
    [JourneyTotalCount]         INT           NULL,
    [JourneyBalance]            FLOAT (53)    NULL,
    [AjustedBoardingCount]      FLOAT (53)    NULL,
    [AjustedAlightingCount]     FLOAT (53)    NULL,
    [AjustedInVehicleCount]     FLOAT (53)    NULL,
    [AjustedVehicleUtilization] FLOAT (53)    NULL,
    [VehicleCapacity]           INT           NULL,
    CONSTRAINT [PK_RK_PaxModel_Daily] PRIMARY KEY CLUSTERED ([JourneyPointRef] ASC, [VehicleId] ASC)
);


GO

