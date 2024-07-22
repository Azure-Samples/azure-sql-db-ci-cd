CREATE TABLE [dim].[RT_ReliabilityType] (
    [ReliabilityTypeKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]           INT            NOT NULL,
    [ValidToDateKey]             INT            NOT NULL,
    [IsCurrent]                  BIT            NOT NULL,
    [SourceSystemCode]           NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]        BIGINT         NULL,
    [ReliabilityType]            INT            NOT NULL,
    [ReliabilityTypeName]        NVARCHAR (250) NOT NULL,
    [ReliabilityTypeDisplayName] NVARCHAR (250) NOT NULL,
    [ValidFromDate]              DATE           NULL,
    [ValidToDate]                DATE           NULL,
    CONSTRAINT [PK_RT_ReliabilityType] PRIMARY KEY CLUSTERED ([ReliabilityTypeKey] ASC),
    CONSTRAINT [BK_RT_ReliabilityType] UNIQUE NONCLUSTERED ([ReliabilityType] ASC)
);


GO

