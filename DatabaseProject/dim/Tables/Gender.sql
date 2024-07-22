CREATE TABLE [dim].[Gender] (
    [GenderKey]           INT           NOT NULL,
    [ValidFromDateKey]    INT           NOT NULL,
    [ValidToDateKey]      INT           NOT NULL,
    [IsCurrent]           BIT           NOT NULL,
    [SourceSystemCode]    NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId] BIGINT        NULL,
    [GenderDisplayIndex]  INT           NOT NULL,
    [GenderDisplayName]   NVARCHAR (12) NOT NULL,
    [ValidFromDate]       DATE          NULL,
    [ValidToDate]         DATE          NULL,
    CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED ([GenderKey] ASC)
);


GO

