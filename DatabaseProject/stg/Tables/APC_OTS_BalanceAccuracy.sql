CREATE TABLE [stg].[APC_OTS_BalanceAccuracy] (
    [YearMonthNo]     INT            NOT NULL,
    [VehicleRef]      NVARCHAR (32)  NOT NULL,
    [ContractorName]  NVARCHAR (250) NULL,
    [ContractName]    NVARCHAR (250) NULL,
    [BalanceAccuracy] FLOAT (53)     NULL
);


GO

