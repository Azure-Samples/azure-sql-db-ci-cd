CREATE TABLE [stg].[APC_OTS_DataCoverage] (
    [YearMonthNo]    INT            NOT NULL,
    [VehicleRef]     NVARCHAR (32)  NOT NULL,
    [ContractorName] NVARCHAR (250) NULL,
    [ContractName]   NVARCHAR (250) NULL,
    [DataCoverage]   FLOAT (53)     NULL
);


GO

