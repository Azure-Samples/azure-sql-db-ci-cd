CREATE TABLE [dim].[RateAreaCombination] (
    [RateAreaCombinationKey]          INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]                INT            NOT NULL,
    [ValidToDateKey]                  INT            NOT NULL,
    [IsCurrent]                       BIT            NOT NULL,
    [SourceSystemCode]                NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]             BIGINT         NULL,
    [RateAreaCombinationCode]         NVARCHAR (20)  NULL,
    [RateAreaCombinationDisplayIndex] INT            NOT NULL,
    [RateAreaCombinationDisplayName]  NVARCHAR (250) NOT NULL,
    [ValidFromDate]                   DATE           NULL,
    [ValidToDate]                     DATE           NULL,
    CONSTRAINT [PK_RateAreaCombination] PRIMARY KEY CLUSTERED ([RateAreaCombinationKey] ASC)
);


GO

