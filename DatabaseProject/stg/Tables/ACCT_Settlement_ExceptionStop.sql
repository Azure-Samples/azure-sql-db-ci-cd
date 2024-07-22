CREATE TABLE [stg].[ACCT_Settlement_ExceptionStop] (
    [ExceptionId]          BIGINT         NOT NULL,
    [Version]              INT            NOT NULL,
    [StopPointNumber]      BIGINT         NOT NULL,
    [StopPointName]        NVARCHAR (250) NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (50)  NULL
);


GO

