CREATE TABLE [dim].[JourneyPatternPoint] (
    [JourneyPatternPointKey]                  INT               IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [MunicipalityKey]                         INT               NOT NULL,
    [RateAreaKey]                             INT               NOT NULL,
    [TariffZoneKey]                           INT               NOT NULL,
    [ValidFromDateKey]                        INT               NOT NULL,
    [ValidToDateKey]                          INT               NOT NULL,
    [IsCurrent]                               BIT               NOT NULL,
    [SourceSystemCode]                        NVARCHAR (20)     NOT NULL,
    [SourceSystemEntryRef]                    NVARCHAR (30)     NOT NULL,
    [MunicipalityDisplayIndex]                INT               NULL,
    [MunicipalityDisplayName]                 NVARCHAR (250)    NULL,
    [MunicipalityCode]                        NVARCHAR (20)     NULL,
    [RateAreaDisplayIndex]                    INT               NULL,
    [RateAreaDisplayName]                     NVARCHAR (250)    NULL,
    [RateAreaCode]                            NVARCHAR (20)     NULL,
    [TariffZoneDisplayIndex]                  INT               NULL,
    [TariffZoneDisplayName]                   NVARCHAR (250)    NULL,
    [TariffZoneNumber]                        INT               NULL,
    [JourneyPatternPointGid]                  BIGINT            NULL,
    [JourneyPatternPointNumber]               INT               NULL,
    [JourneyPatternPointRoadElementName]      NVARCHAR (250)    NULL,
    [JourneyPatternPointCoordinateSystemCode] NVARCHAR (20)     NULL,
    [JourneyPatternPointEastingCoordinate]    DECIMAL (18, 4)   NULL,
    [JourneyPatternPointNorthingCoordinate]   DECIMAL (18, 4)   NULL,
    [JourneyPatternPointLatitude]             DECIMAL (18, 12)  NULL,
    [JourneyPatternPointLongitude]            DECIMAL (18, 12)  NULL,
    [JourneyPatternPointGeography]            [sys].[geography] NULL,
    [JourneyPatternPointHexagonTileLowId]     INT               NULL,
    [JourneyPatternPointHexagonTileMediumId]  INT               NULL,
    [JourneyPatternPointHexagonTileHighId]    INT               NULL,
    [JourneyPatternPointIsStopPoint]          BIT               NULL,
    [StopPointGid]                            BIGINT            NULL,
    [StopPointId]                             BIGINT            NULL,
    [StopPointOwner]                          INT               NULL,
    [StopPointNumber]                         INT               NULL,
    [StopPointTypeCode]                       NVARCHAR (20)     NULL,
    [StopPointDisplayIndex]                   INT               NULL,
    [StopPointDisplayName]                    NVARCHAR (250)    NULL,
    [StopPointName]                           NVARCHAR (250)    NULL,
    [StopPointShortName]                      NVARCHAR (250)    NULL,
    [StopPointIsForBoarding]                  BIT               NULL,
    [StopPointIsForAlighting]                 BIT               NULL,
    [StopAreaGid]                             BIGINT            NULL,
    [StopAreaOwner]                           INT               NULL,
    [StopAreaNumber]                          INT               NULL,
    [StopAreaTypeCode]                        NVARCHAR (20)     NULL,
    [StopAreaName]                            NVARCHAR (250)    NULL,
    [StopAreaShortName]                       NVARCHAR (250)    NULL,
    [StopAreaDisplayIndex]                    INT               NULL,
    [StopAreaDisplayName]                     NVARCHAR (250)    NULL,
    [StopAreaAbbreviation]                    NVARCHAR (10)     NULL,
    [StopAreaCoordinateSystemCode]            NVARCHAR (20)     NULL,
    [StopAreaCentroidEastingCoordinate]       DECIMAL (18, 4)   NULL,
    [StopAreaCentroidNorthingCoordinate]      DECIMAL (18, 4)   NULL,
    [StopAreaCentroidLatitude]                DECIMAL (18, 12)  NULL,
    [StopAreaCentroidLongitude]               DECIMAL (18, 12)  NULL,
    [StopAreaCentroidGeography]               [sys].[geography] NULL,
    [ValidFromDate]                           DATE              NULL,
    [ValidToDate]                             DATE              NULL,
    [LastModifiedUtcDateTime]                 DATETIME          NULL,
    CONSTRAINT [PK_JourneyPatternPoint] PRIMARY KEY NONCLUSTERED ([JourneyPatternPointKey] ASC),
    CONSTRAINT [IX_JourneyPatternPoint_SourceSystemCode_SourceSystemEntryId_ValidFromDate] UNIQUE CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC, [ValidFromDate] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPatternPoint_JourneyPatternPointGid_Current]
    ON [dim].[JourneyPatternPoint]([JourneyPatternPointGid] ASC, [IsCurrent] ASC)
    INCLUDE([StopPointName], [JourneyPatternPointRoadElementName], [JourneyPatternPointLatitude], [JourneyPatternPointLongitude]);


GO

CREATE NONCLUSTERED INDEX [BK_JourneyPatternPoint_ValidityKey]
    ON [dim].[JourneyPatternPoint]([JourneyPatternPointGid] ASC, [ValidFromDateKey] ASC, [ValidToDateKey] ASC)
    INCLUDE([JourneyPatternPointNumber], [JourneyPatternPointRoadElementName], [JourneyPatternPointCoordinateSystemCode], [JourneyPatternPointEastingCoordinate], [JourneyPatternPointNorthingCoordinate], [JourneyPatternPointLatitude], [JourneyPatternPointLongitude], [JourneyPatternPointGeography], [JourneyPatternPointHexagonTileLowId], [JourneyPatternPointHexagonTileMediumId], [JourneyPatternPointHexagonTileHighId], [JourneyPatternPointIsStopPoint], [StopPointGid], [StopPointId], [StopPointOwner], [StopPointNumber], [StopPointTypeCode], [StopPointDisplayIndex], [StopPointDisplayName], [StopPointName], [StopPointShortName], [StopPointIsForBoarding], [StopPointIsForAlighting], [StopAreaGid], [StopAreaOwner], [StopAreaNumber], [StopAreaTypeCode], [StopAreaName], [StopAreaShortName], [StopAreaDisplayIndex], [StopAreaDisplayName], [StopAreaAbbreviation], [StopAreaCoordinateSystemCode], [StopAreaCentroidEastingCoordinate], [StopAreaCentroidNorthingCoordinate], [StopAreaCentroidLatitude], [StopAreaCentroidLongitude], [StopAreaCentroidGeography]);


GO

CREATE NONCLUSTERED INDEX [IX_JourneyPatternPoint_StopPointId_Current]
    ON [dim].[JourneyPatternPoint]([StopPointId] ASC, [IsCurrent] ASC)
    INCLUDE([StopPointName], [JourneyPatternPointRoadElementName], [JourneyPatternPointLatitude], [JourneyPatternPointLongitude]);


GO

