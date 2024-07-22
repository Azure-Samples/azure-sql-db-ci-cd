CREATE TABLE [stg].[RT_DOI_MunicipalityPerJourneyPatternPoint] (
    [SourceSystemCode]        NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]     BIGINT        NULL,
    [JourneyPatternPointGid]  BIGINT        NULL,
    [MunicipalityCode]        NVARCHAR (20) NULL,
    [ValidFromDate]           DATE          NULL,
    [ValidToDate]             DATE          NULL,
    [LastModifiedUtcDateTime] DATETIME      NULL
);


GO

