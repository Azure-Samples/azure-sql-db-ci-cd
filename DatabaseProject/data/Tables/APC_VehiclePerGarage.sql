CREATE TABLE [data].[APC_VehiclePerGarage] (
    [ContractorName]  NVARCHAR (50)  NOT NULL,
    [GarageName]      NVARCHAR (50)  NOT NULL,
    [GarageCode]      NVARCHAR (10)  NOT NULL,
    [VehicleNumber]   VARCHAR (4)    NOT NULL,
    [ValidFromPeriod] INT            NOT NULL,
    [ValidToPeriod]   INT            NOT NULL,
    [Inserted]        DATETIME2 (0)  NULL,
    [Updated]         DATETIME2 (0)  NULL,
    [Hash]            VARBINARY (32) NULL,
    CONSTRAINT [PK_APC_VehiclePerGarage] PRIMARY KEY CLUSTERED ([ContractorName] ASC, [GarageName] ASC, [GarageCode] ASC, [VehicleNumber] ASC, [ValidFromPeriod] ASC)
);


GO

