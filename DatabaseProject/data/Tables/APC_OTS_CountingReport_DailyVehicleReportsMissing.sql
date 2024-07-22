CREATE TABLE [data].[APC_OTS_CountingReport_DailyVehicleReportsMissing] (
    [OperatingDayDate]          DATE           NOT NULL,
    [VehicleRef]                NVARCHAR (32)  NOT NULL,
    [Garage]                    NVARCHAR (50)  NULL,
    [Contractor]                NVARCHAR (250) NULL,
    [ContractUnit]              NVARCHAR (250) NULL,
    [Number of Journeys]        INT            NULL,
    [Number of CountingReports] INT            NULL,
    [OTS]                       NVARCHAR (250) NULL,
    [OTS_Number]                INT            NULL,
    [Inserted]                  DATETIME2 (0)  NULL,
    [Updated]                   DATETIME2 (0)  NULL,
    CONSTRAINT [PK_APC_OTS_CountingReport_DailyVehicleReportsMissing] PRIMARY KEY CLUSTERED ([OperatingDayDate] ASC, [VehicleRef] ASC)
);


GO

