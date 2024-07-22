CREATE TABLE [stg].[GIS_RouteLink_StopPoint] (
    [LinkRef]                    NVARCHAR (20)     NULL,
    [ValidFromDate]              DATE              NULL,
    [ValidToDate]                DATE              NULL,
    [IsCurrent]                  BIT               NULL,
    [FromStopPointId]            INT               NULL,
    [ToStopPointId]              INT               NULL,
    [FromJourneyPatternPointGid] NUMERIC (16)      NULL,
    [ToJourneyPatternPointGid]   NUMERIC (16)      NULL,
    [Lines]                      NVARCHAR (100)    NULL,
    [GeographyWkt]               VARCHAR (MAX)     NULL,
    [Geography]                  [sys].[geography] NULL,
    [Length]                     DECIMAL (9, 2)    NULL,
    [Checksum]                   BINARY (32)       NULL,
    [SourceSystemCode]           NVARCHAR (20)     NULL,
    [SourceSystemEntryRef]       NVARCHAR (20)     NULL
);


GO

