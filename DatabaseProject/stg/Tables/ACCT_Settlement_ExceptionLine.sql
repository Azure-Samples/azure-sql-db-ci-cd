CREATE TABLE [stg].[ACCT_Settlement_ExceptionLine] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NULL,
    [LineNumber]           INT            NOT NULL,
    [LineDesignation]      NVARCHAR (20)  NULL,
    [LineDirectionCode]    INT            NOT NULL,
    [LineDirectionName]    NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL
);


GO

