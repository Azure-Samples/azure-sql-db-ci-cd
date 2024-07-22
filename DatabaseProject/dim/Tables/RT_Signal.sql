CREATE TABLE [dim].[RT_Signal] (
    [SignalKey]            INT               IDENTITY (1, 1) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (40)     NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)     NOT NULL,
    [Name]                 VARCHAR (20)      NOT NULL,
    [Location]             VARCHAR (100)     NOT NULL,
    [Municipality]         VARCHAR (20)      NOT NULL,
    [Longitude]            DECIMAL (18, 11)  NULL,
    [Latitude]             DECIMAL (18, 11)  NULL,
    [Center]               [sys].[geography] NULL,
    [IsCurrent]            BIT               NULL,
    [ValidFromDate]        DATE              NULL,
    [ValidToDate]          DATE              NULL,
    [Inserted]             DATETIME2 (0)     NULL,
    [Updated]              DATETIME2 (0)     NULL,
    CONSTRAINT [PK_RT_Signal] PRIMARY KEY CLUSTERED ([SignalKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_Signal_Merge]
    ON [dim].[RT_Signal]([SourceSystemEntryRef] ASC, [ValidFromDate] ASC);


GO

