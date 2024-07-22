CREATE TABLE [data].[APC_OTS_CountingReport_JourneyDataCoverage] (
    [OperatingDayDate]    DATE           NOT NULL,
    [VehicleRef]          NVARCHAR (32)  NOT NULL,
    [JourneyRef]          NVARCHAR (18)  NOT NULL,
    [Contractor]          NVARCHAR (250) NULL,
    [Garage]              NVARCHAR (50)  NULL,
    [CountingReportCount] INT            NOT NULL,
    [ExpectedReportCount] INT            NOT NULL,
    [Inserted]            DATETIME2 (0)  NULL,
    [Updated]             DATETIME2 (0)  NULL,
    CONSTRAINT [PK_APC_OTS_CountingReport_JourneyDataCoverage] PRIMARY KEY CLUSTERED ([OperatingDayDate] ASC, [VehicleRef] ASC, [JourneyRef] ASC)
);


GO

