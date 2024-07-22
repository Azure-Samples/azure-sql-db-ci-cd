CREATE TABLE [dim].[QC_Cause] (
    [CauseKey]         INT            IDENTITY (1, 1) NOT NULL,
    [CauseId]          INT            NOT NULL,
    [ValidFromDateKey] INT            NOT NULL,
    [ValidToDateKey]   INT            NOT NULL,
    [IsCurrent]        BIT            NOT NULL,
    [SourceSystemCode] NVARCHAR (20)  NOT NULL,
    [StatusId]         INT            NOT NULL,
    [GroupId]          INT            NOT NULL,
    [CauseName]        NVARCHAR (250) NULL,
    [ValidFromDate]    DATE           NOT NULL,
    [ValidToDate]      DATE           NULL,
    [Inserted]         DATETIME2 (0)  NOT NULL,
    [Updated]          DATETIME2 (0)  NOT NULL,
    CONSTRAINT [CauseKey] PRIMARY KEY CLUSTERED ([CauseKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QC_Cause_Merge]
    ON [dim].[QC_Cause]([CauseId] ASC, [StatusId] ASC, [GroupId] ASC);


GO

