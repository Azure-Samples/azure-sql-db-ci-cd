CREATE TABLE [data].[RT_Signal] (
    [SignalId]             INT               IDENTITY (1, 1) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (40)     NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)     NOT NULL,
    [Name]                 VARCHAR (20)      NOT NULL,
    [Location]             VARCHAR (100)     NOT NULL,
    [Municipality]         VARCHAR (20)      NOT NULL,
    [Longitude]            DECIMAL (18, 11)  NOT NULL,
    [Latitude]             DECIMAL (18, 11)  NOT NULL,
    [Center]               [sys].[geography] NOT NULL,
    [IsCurrent]            BIT               NULL,
    [ValidFromDate]        DATE              NULL,
    [ValidToDate]          DATE              NULL,
    [Inserted]             DATETIME2 (0)     NOT NULL,
    [Updated]              DATETIME2 (0)     NULL,
    [Hash]                 VARBINARY (32)    NOT NULL,
    CONSTRAINT [PK_RT_Signal] PRIMARY KEY CLUSTERED ([SignalId] ASC)
);


GO

