CREATE TABLE [data].[RT_DOI_TariffZonePerJourneyPatternPoint] (
    [SourceSystemCode]        NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]     BIGINT        NULL,
    [JourneyPatternPointGid]  BIGINT        NULL,
    [TariffZoneNumber]        SMALLINT      NULL,
    [RateAreaCode]            NVARCHAR (20) NULL,
    [ValidFromDate]           DATE          NULL,
    [ValidToDate]             DATE          NULL,
    [LastModifiedUtcDateTime] DATETIME      NULL
);


GO

