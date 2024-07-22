CREATE TABLE [data].[ACCT_Settlement_ExceptionStop] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [StopPointNumber]      BIGINT         NOT NULL,
    [StopPointName]        NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL,
    [Hash]                 BINARY (32)    NULL,
    [Inserted]             DATETIME2 (7)  NULL,
    [Updated]              DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_ExceptionStop_1] PRIMARY KEY CLUSTERED ([ExceptionId] ASC, [Version] ASC, [StopPointNumber] ASC)
);


GO

