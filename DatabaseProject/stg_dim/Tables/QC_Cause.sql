CREATE TABLE [stg_dim].[QC_Cause] (
    [CauseId]          BIGINT        NULL,
    [ValidFromDateKey] INT           NULL,
    [ValidToDateKey]   INT           NULL,
    [IsCurrent]        BIT           NULL,
    [SourceSystemCode] NVARCHAR (20) NULL,
    [StatusId]         BIGINT        NULL,
    [CauseName]        VARCHAR (255) NULL,
    [GroupId]          INT           NULL,
    [ValidFromDate]    DATE          NULL,
    [ValidToDate]      DATE          NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Cause_Merge]
    ON [stg_dim].[QC_Cause]([CauseId] ASC, [StatusId] ASC, [GroupId] ASC)
    INCLUDE([CauseName], [IsCurrent], [SourceSystemCode], [ValidFromDate], [ValidFromDateKey], [ValidToDate], [ValidToDateKey]);


GO

