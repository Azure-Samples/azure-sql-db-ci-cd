CREATE TABLE [data].[ACCT_Settlement_ExceptionContractUnit] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [ContractCode]         NVARCHAR (100) NOT NULL,
    [ContractName]         NVARCHAR (250) NULL,
    [TenderCode]           NVARCHAR (100) NULL,
    [ContractorCode]       NVARCHAR (100) NULL,
    [ContractorName]       NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [Hash]                 BINARY (32)    NULL,
    [Inserted]             DATETIME2 (7)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_ExceptionContractUnit] PRIMARY KEY CLUSTERED ([ExceptionId] ASC, [Version] ASC, [ContractCode] ASC)
);


GO

