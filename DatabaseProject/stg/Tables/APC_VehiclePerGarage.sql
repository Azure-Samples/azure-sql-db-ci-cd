CREATE TABLE [stg].[APC_VehiclePerGarage] (
    [ContractorName]  NVARCHAR (50) NOT NULL,
    [GarageName]      NVARCHAR (50) NOT NULL,
    [GarageCode]      NVARCHAR (10) NOT NULL,
    [VehicleNumber]   VARCHAR (4)   NOT NULL,
    [ValidFromPeriod] INT           NOT NULL,
    [ValidToPeriod]   INT           NOT NULL
);


GO

