CREATE TABLE [data].[GIS_RouteLink_StopPoint] (
    [LinkRef]                    NVARCHAR (20)     NOT NULL,
    [ValidFromDate]              DATE              NOT NULL,
    [ValidToDate]                DATE              NULL,
    [IsCurrent]                  BIT               NOT NULL,
    [FromStopPointId]            INT               NOT NULL,
    [ToStopPointId]              INT               NOT NULL,
    [FromJourneyPatternPointGid] NUMERIC (16)      NULL,
    [ToJourneyPatternPointGid]   NUMERIC (16)      NULL,
    [Lines]                      NVARCHAR (100)    NULL,
    [Geography]                  [sys].[geography] NOT NULL,
    [Length]                     DECIMAL (9, 2)    NOT NULL,
    [Checksum]                   BINARY (32)       NOT NULL,
    [SourceSystemCode]           NVARCHAR (20)     NOT NULL,
    [SourceSystemEntryRef]       NVARCHAR (20)     NOT NULL,
    [InsertedUtc]                DATETIME2 (0)     NOT NULL,
    [UpdatedUtc]                 DATETIME2 (0)     NOT NULL,
    CONSTRAINT [PK_GIS_RouteLink_StopPoint] PRIMARY KEY CLUSTERED ([LinkRef] ASC, [ValidFromDate] ASC)
);


GO

