CREATE TABLE [stg_dim].[QC_Group] (
    [GroupId]          BIGINT        NOT NULL,
    [ValidFromDateKey] INT           NULL,
    [ValidToDateKey]   INT           NULL,
    [IsCurrent]        BIT           NULL,
    [SourceSystemCode] NVARCHAR (20) NULL,
    [StatusId]         BIGINT        NULL,
    [GroupName]        VARCHAR (255) NULL,
    [ValidFromDate]    DATE          NULL,
    [ValidToDate]      DATE          NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Group_Merge]
    ON [stg_dim].[QC_Group]([GroupId] ASC, [StatusId] ASC)
    INCLUDE([GroupName], [IsCurrent], [SourceSystemCode], [ValidFromDate], [ValidFromDateKey], [ValidToDate], [ValidToDateKey]);


GO

