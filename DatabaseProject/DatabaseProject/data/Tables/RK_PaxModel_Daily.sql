CREATE TABLE [data].[RK_PaxModel_Daily] (
    [JourneyRef]                CHAR (18)     NOT NULL,
    [JourneyPointRef]           CHAR (22)     NOT NULL,
    [OperatingDayDate]          DATE          NULL,
    [PlannedDepartureDateTime]  DATETIME2 (3) NULL,
    [ObservedVehicleId]         INT           NULL,
    [VehicleId]                 INT           NULL,
    [IsPrimaryVehicle]          BIT           NOT NULL,
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
    [Inserted]                  DATETIME2 (0) NULL,
    [Updated]                   DATETIME2 (0) NULL
);


GO

CREATE NONCLUSTERED INDEX [<Name of Missing Index, sysname,>]
    ON [data].[RK_PaxModel_Daily]([JourneyRef] ASC, [OperatingDayDate] ASC)
    INCLUDE([JourneyPointRef], [PlannedDepartureDateTime], [BoardingCount], [InVehicleCount], [AjustedBoardingCount], [AjustedVehicleUtilization], [VehicleCapacity]);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RK_PaxModel_Daily_Merge]
    ON [data].[RK_PaxModel_Daily]([JourneyPointRef] ASC, [VehicleId] ASC)
    INCLUDE([JourneyRef]);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RK_PaxModel_Daily]
    ON [data].[RK_PaxModel_Daily];


GO

