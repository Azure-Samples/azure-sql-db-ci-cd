CREATE TABLE [stg].[ACCT_Settlement_StopException_Monthly] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              BIGINT         NOT NULL,
    [RegisteredBy]         NVARCHAR (250) NOT NULL,
    [FromDateTime]         DATETIME       NOT NULL,
    [ToDateTime]           DATETIME       NOT NULL,
    [SettlementCode]       INT            NOT NULL,
    [StopPointNumber]      BIGINT         NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL
);


GO

