CREATE TABLE [stg].[ACCT_Settlement_ExceptionContractUnit] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [ContractCode]         NVARCHAR (100) NOT NULL,
    [ContractName]         NVARCHAR (250) NULL,
    [TenderCode]           NVARCHAR (100) NULL,
    [ContractorCode]       NVARCHAR (100) NULL,
    [ContractorName]       NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL
);


GO

