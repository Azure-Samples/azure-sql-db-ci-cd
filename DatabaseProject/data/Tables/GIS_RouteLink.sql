CREATE TABLE [data].[GIS_RouteLink] (
    [RouteLinkKey]                                   INT             IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]                               NVARCHAR (20)   NULL,
    [RouteLinkRef]                                   NVARCHAR (250)  NULL,
    [IsCurrent]                                      BIT             CONSTRAINT [DF_GIS_RouteLink_IsCurrent] DEFAULT ((1)) NOT NULL,
    [StartAtJourneyPatternPointId]                   DECIMAL (16)    NOT NULL,
    [StartAtJourneyPatternPointGid]                  DECIMAL (16)    NOT NULL,
    [StartAtJourneyPatternPointNumber]               DECIMAL (16)    NULL,
    [StartAtJourneyPatternPointOperatorGid]          DECIMAL (16)    NULL,
    [StartAtJourneyPatternPointTypeCode]             DECIMAL (16)    NULL,
    [StartAtJourneyPatternPointLocationCoordinate_1] DECIMAL (16, 2) NOT NULL,
    [StartAtJourneyPatternPointLocationCoordinate_2] DECIMAL (16, 2) NOT NULL,
    [EndAtJourneyPatternPointId]                     DECIMAL (16)    NOT NULL,
    [EndAtJourneyPatternPointGid]                    DECIMAL (16)    NOT NULL,
    [EndAtJourneyPatternPointNumber]                 DECIMAL (16)    NULL,
    [EndAtJourneyPatternPointOperatorGid]            DECIMAL (16)    NULL,
    [EndAtJourneyPatternPointTypeCode]               DECIMAL (16)    NULL,
    [EndAtJourneyPatternPointLocationCoordinate_1]   DECIMAL (16, 2) NOT NULL,
    [EndAtJourneyPatternPointLocationCoordinate_2]   DECIMAL (16, 2) NOT NULL,
    [LengthMeters]                                   DECIMAL (12, 2) NOT NULL,
    [ValidFromDate]                                  DATE            NULL,
    [ValidToDate]                                    DATE            NULL,
    CONSTRAINT [PK_GIS_RouteLink] PRIMARY KEY CLUSTERED ([RouteLinkKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [GIS_RouteLink_StartAtJourneyPatternPointId_EndAtJourneyPatternPointId]
    ON [data].[GIS_RouteLink]([StartAtJourneyPatternPointId] ASC, [EndAtJourneyPatternPointId] ASC)
    INCLUDE([LengthMeters]);


GO

