CREATE TABLE [stg].[ACCT_Settlement_ContractException_Monthly] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [RegisteredBy]         NVARCHAR (250) NOT NULL,
    [FromDateTime]         DATETIME       NOT NULL,
    [ToDateTime]           DATETIME       NOT NULL,
    [SettlementCode]       INT            NOT NULL,
    [ContractCode]         NVARCHAR (100) NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL
);


GO

