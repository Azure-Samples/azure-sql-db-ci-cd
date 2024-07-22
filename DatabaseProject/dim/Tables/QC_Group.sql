CREATE TABLE [dim].[QC_Group] (
    [GroupKey]         INT            IDENTITY (1, 1) NOT NULL,
    [GroupId]          INT            NOT NULL,
    [ValidFromDateKey] INT            NOT NULL,
    [ValidToDateKey]   INT            NOT NULL,
    [IsCurrent]        BIT            NOT NULL,
    [SourceSystemCode] NVARCHAR (20)  NOT NULL,
    [StatusId]         INT            NOT NULL,
    [GroupName]        NVARCHAR (250) NULL,
    [ValidFromDate]    DATE           NOT NULL,
    [ValidToDate]      DATE           NULL,
    [Inserted]         DATETIME2 (0)  NOT NULL,
    [Updated]          DATETIME2 (0)  NOT NULL,
    CONSTRAINT [GroupKey] PRIMARY KEY CLUSTERED ([GroupKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Group_Merge]
    ON [dim].[QC_Group]([GroupId] ASC, [StatusId] ASC);


GO

