CREATE TABLE [dim].[RT_FareSet] (
    [FareSetKey]          INT            NOT NULL,
    [ValidFromDateKey]    INT            NOT NULL,
    [ValidToDateKey]      INT            NOT NULL,
    [IsCurrent]           INT            NOT NULL,
    [SourceSystemCode]    NVARCHAR (20)  NULL,
    [SourceSystemEntryId] NVARCHAR (20)  NULL,
    [FareSetCode]         NVARCHAR (20)  NULL,
    [FareSetNumber]       INT            NULL,
    [FareSetName]         NVARCHAR (100) NULL,
    [FareSetDisplayIndex] INT            NOT NULL
);


GO

