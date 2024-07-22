CREATE TABLE [stg].[RT_LineProductGroup] (
    [LineNumber]               INT           NULL,
    [ProductGroupCode]         NVARCHAR (20) NULL,
    [ValidFromDate]            DATE          NULL,
    [ValidToDate]              DATE          NULL,
    [SourceSystemCode]         NVARCHAR (20) NULL,
    [SourceSystemEntryRef]     BIGINT        NULL,
    [LineSourceSystemEntryRef] BIGINT        NULL
);


GO

