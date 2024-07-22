CREATE TABLE [data].[ACCT_Settlement_ExceptionLine] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [LineNumber]           INT            NOT NULL,
    [LineDesignation]      NVARCHAR (20)  NULL,
    [LineDirectionCode]    INT            NOT NULL,
    [LineDirectionName]    NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [Hash]                 BINARY (32)    NULL,
    [Inserted]             DATETIME2 (7)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_ExceptionLine] PRIMARY KEY CLUSTERED ([ExceptionId] ASC, [Version] ASC, [LineNumber] ASC, [LineDirectionCode] ASC)
);


GO

