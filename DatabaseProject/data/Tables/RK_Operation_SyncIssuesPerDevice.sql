CREATE TABLE [data].[RK_Operation_SyncIssuesPerDevice] (
    [BusinessDate]         DATE          NOT NULL,
    [DeviceID]             INT           NOT NULL,
    [VehicleID]            INT           NOT NULL,
    [ContractorCode]       NVARCHAR (20) NULL,
    [ContractorGarageCode] NVARCHAR (20) NULL,
    [TransactionCount]     INT           NOT NULL,
    [MsgReportDateMax]     DATETIME2 (0) NOT NULL,
    [RegistrationDateTime] DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_RK_Operation_SyncIssuesPerDevice] PRIMARY KEY CLUSTERED ([BusinessDate] ASC, [DeviceID] ASC, [VehicleID] ASC)
);


GO

