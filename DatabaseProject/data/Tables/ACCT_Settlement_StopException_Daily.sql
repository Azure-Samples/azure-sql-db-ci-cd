CREATE TABLE [data].[ACCT_Settlement_StopException_Daily] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              BIGINT         NOT NULL,
    [RegisteredBy]         NVARCHAR (250) NOT NULL,
    [FromDateTime]         DATETIME       NOT NULL,
    [ToDateTime]           DATETIME       NOT NULL,
    [SettlementCode]       INT            NOT NULL,
    [StopPointNumber]      BIGINT         NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [Hash]                 BINARY (32)    NULL,
    [Inserted]             DATETIME2 (7)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_StopException_Daily] PRIMARY KEY CLUSTERED ([ExceptionId] ASC, [Version] ASC, [StopPointNumber] ASC)
);


GO

