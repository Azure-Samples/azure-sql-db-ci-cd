CREATE TABLE [stg].[QA_ServiceQuality_ContractOfferedServiceLevel] (
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] BIGINT         NULL,
    [ContractCode]         NVARCHAR (20)  NULL,
    [OfferedServiceLevel]  DECIMAL (5, 2) NULL,
    [ModifiedAt]           DATETIME2 (0)  NULL
);


GO

