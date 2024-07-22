CREATE TABLE [dim].[StopPoint] (
    [StopPointKey]                            INT               IDENTITY (1, 1) NOT NULL,
    [MunicipalityKey]                         INT               NOT NULL,
    [RateAreaKey]                             INT               NOT NULL,
    [TariffZoneKey]                           INT               NOT NULL,
    [ValidFromDateKey]                        INT               NOT NULL,
    [ValidToDateKey]                          INT               NOT NULL,
    [IsCurrent]                               BIT               NOT NULL,
    [SourceSystemCode]                        NVARCHAR (20)     NOT NULL,
    [SourceSystemEntryId]                     NVARCHAR (30)     NULL,
    [MunicipalityDisplayIndex]                INT               NOT NULL,
    [MunicipalityDisplayName]                 NVARCHAR (250)    NOT NULL,
    [MunicipalityCode]                        NVARCHAR (20)     NULL,
    [RateAreaDisplayIndex]                    INT               NOT NULL,
    [RateAreaDisplayName]                     NVARCHAR (250)    NOT NULL,
    [RateAreaCode]                            NVARCHAR (20)     NULL,
    [TariffZoneDisplayIndex]                  INT               NOT NULL,
    [TariffZoneDisplayName]                   NVARCHAR (250)    NOT NULL,
    [TariffZoneNumber]                        INT               NULL,
    [JourneyPatternPointGid]                  BIGINT            NULL,
    [JourneyPatternPointNumber]               INT               NULL,
    [JourneyPatternPointRoadElementName]      NVARCHAR (250)    NULL,
    [JourneyPatternPointCoordinateSystemCode] NVARCHAR (20)     NULL,
    [JourneyPatternPointEastingCoordinate]    DECIMAL (18, 4)   NULL,
    [JourneyPatternPointNorthingCoordinate]   DECIMAL (18, 4)   NULL,
    [StopPointGid]                            BIGINT            NULL,
    [StopPointNumber]                         INT               NULL,
    [StopPointTypeCode]                       NVARCHAR (20)     NULL,
    [StopPointDisplayIndex]                   INT               NOT NULL,
    [StopPointDisplayName]                    NVARCHAR (250)    NOT NULL,
    [StopPointName]                           NVARCHAR (250)    NULL,
    [StopPointShortName]                      NVARCHAR (250)    NULL,
    [StopPointIsForBoarding]                  BIT               NULL,
    [StopPointIsForAlighting]                 BIT               NULL,
    [ValidFromDate]                           DATE              NULL,
    [ValidToDate]                             DATE              NULL,
    [LastModifiedUtcDateTime]                 DATETIME          NULL,
    [JourneyPatternPointLatitude]             DECIMAL (18, 12)  NULL,
    [JourneyPatternPointLongitude]            DECIMAL (18, 12)  NULL,
    [JourneyPatternPointGeography]            [sys].[geography] NULL,
    [StopPointOwner]                          INT               NULL,
    [StopPointId]                             BIGINT            NULL,
    CONSTRAINT [PK_StopPoint] PRIMARY KEY NONCLUSTERED ([StopPointKey] ASC),
    CONSTRAINT [IX_StopPoint_SourceSystemCode_SourceSystemEntryId_ValidFromDate] UNIQUE CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_StopPointNumber]
    ON [dim].[StopPoint]([StopPointNumber] ASC)
    INCLUDE([IsCurrent], [JourneyPatternPointLatitude], [JourneyPatternPointLongitude]);


GO

CREATE NONCLUSTERED INDEX [IX_StopPoint_StopPointId]
    ON [dim].[StopPoint]([StopPointId] ASC)
    INCLUDE([StopPointKey], [StopPointOwner], [StopPointNumber], [StopPointDisplayIndex], [StopPointDisplayName], [JourneyPatternPointGeography]) WHERE ([IsCurrent]=(1));


GO

CREATE NONCLUSTERED INDEX [IX_StopPoint_StopPointGid]
    ON [dim].[StopPoint]([StopPointGid] ASC);


GO

