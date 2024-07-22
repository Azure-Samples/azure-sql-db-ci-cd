CREATE TABLE [data].[RK_PaxModel_VehicleCapacity] (
    [VehicleNumber]   INT             NOT NULL,
    [SeatingCapacity] DECIMAL (10, 2) NULL,
    [TotalCapacity]   DECIMAL (10, 2) NULL,
    [Source]          NVARCHAR (50)   NULL,
    CONSTRAINT [PK_RK_PaxModel_VehicleCapacity] PRIMARY KEY CLUSTERED ([VehicleNumber] ASC)
);


GO

