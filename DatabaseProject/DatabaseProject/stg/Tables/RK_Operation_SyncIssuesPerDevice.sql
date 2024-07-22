CREATE TABLE [stg].[RK_Operation_SyncIssuesPerDevice] (
    [BusinessDate]         DATE          NOT NULL,
    [DeviceID]             INT           NOT NULL,
    [VehicleID]            INT           NULL,
    [ContractorCode]       NVARCHAR (20) NULL,
    [ContractorGarageCode] NVARCHAR (20) NULL,
    [TransactionCount]     INT           NULL,
    [MsgReportDateMax]     DATETIME2 (0) NULL,
    [RegistrationDateTime] DATETIME2 (0) NULL,
    CONSTRAINT [PK_RK_Operation_SyncIssuesPerDevice] PRIMARY KEY CLUSTERED ([BusinessDate] ASC, [DeviceID] ASC)
);


GO

