CREATE TABLE [stg_dim].[QC_Status] (
    [StatusId]          BIGINT        NULL,
    [ValidFromDateKey]  INT           NULL,
    [ValidToDateKey]    INT           NULL,
    [IsCurrent]         BIT           NULL,
    [SourceSystemCode]  NVARCHAR (20) NULL,
    [StatusName]        VARCHAR (255) NULL,
    [StatusDescription] VARCHAR (255) NULL,
    [ValidFromDate]     DATE          NULL,
    [ValidToDate]       DATE          NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Status_Merge]
    ON [stg_dim].[QC_Status]([StatusId] ASC)
    INCLUDE([IsCurrent], [SourceSystemCode], [StatusDescription], [StatusName], [ValidFromDate], [ValidFromDateKey], [ValidToDate], [ValidToDateKey]);


GO

