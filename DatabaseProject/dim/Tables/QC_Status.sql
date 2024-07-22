CREATE TABLE [dim].[QC_Status] (
    [StatusKey]         INT            IDENTITY (1, 1) NOT NULL,
    [StatusId]          INT            NOT NULL,
    [ValidFromDateKey]  INT            NOT NULL,
    [ValidToDateKey]    INT            NOT NULL,
    [IsCurrent]         BIT            NOT NULL,
    [SourceSystemCode]  NVARCHAR (20)  NOT NULL,
    [StatusName]        NVARCHAR (250) NULL,
    [StatusDescription] NVARCHAR (250) NULL,
    [ValidFromDate]     DATE           NOT NULL,
    [ValidToDate]       DATE           NULL,
    [Inserted]          DATETIME2 (0)  NULL,
    [Updated]           DATETIME2 (0)  NULL,
    CONSTRAINT [StatusKey] PRIMARY KEY CLUSTERED ([StatusKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Status_Merge]
    ON [dim].[QC_Status]([StatusId] ASC);


GO

