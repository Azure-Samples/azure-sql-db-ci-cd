CREATE TABLE [data].[RT_LineProductGroup] (
    [LineNumber]               INT           NOT NULL,
    [ProductGroupCode]         NVARCHAR (20) NOT NULL,
    [ValidFromDate]            DATE          NOT NULL,
    [ValidToDate]              DATE          NULL,
    [SourceSystemCode]         NVARCHAR (20) NULL,
    [SourceSystemEntryRef]     BIGINT        NULL,
    [LineSourceSystemEntryRef] BIGINT        NULL,
    CONSTRAINT [PK_RT_LineProductGroup] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [ValidFromDate] ASC)
);


GO

