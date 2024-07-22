CREATE TABLE [data].[APC_ATS_VehiclePerGarage] (
    [ContractorName]  NVARCHAR (50)  NOT NULL,
    [GarageName]      NVARCHAR (50)  NOT NULL,
    [GarageCode]      NVARCHAR (10)  NOT NULL,
    [GarageListName]  NVARCHAR (100) NOT NULL,
    [VehicleNumber]   VARCHAR (4)    NOT NULL,
    [ValidFromPeriod] INT            NOT NULL,
    [ValidToPeriod]   INT            NOT NULL,
    [Inserted]        DATETIME2 (0)  NULL,
    [Updated]         DATETIME2 (0)  NULL,
    [Hash]            VARBINARY (32) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_APC_ATS_VehiclePerGarage]
    ON [data].[APC_ATS_VehiclePerGarage]([ContractorName] ASC, [GarageName] ASC, [VehicleNumber] ASC)
    INCLUDE([Hash]);


GO

