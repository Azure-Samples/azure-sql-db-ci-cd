CREATE TABLE [data].[ACCT_Settlement_LineException_Monthly] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [RegisteredBy]         NVARCHAR (250) NOT NULL,
    [FromDateTime]         DATETIME       NOT NULL,
    [ToDateTime]           DATETIME       NOT NULL,
    [SettlementCode]       INT            NOT NULL,
    [LineNumber]           BIGINT         NOT NULL,
    [LineDirectionCode]    INT            NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [Hash]                 BINARY (32)    NULL,
    [Inserted]             DATETIME2 (7)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_LineException_Monthly] PRIMARY KEY CLUSTERED ([ExceptionId] ASC, [Version] ASC, [LineNumber] ASC, [LineDirectionCode] ASC)
);


GO

