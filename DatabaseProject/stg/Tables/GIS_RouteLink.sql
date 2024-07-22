CREATE TABLE [stg].[GIS_RouteLink] (
    [RouteLinkKey]                                   INT             NULL,
    [SourceSystemCode]                               NVARCHAR (20)   NULL,
    [RouteLinkRef]                                   NVARCHAR (25)   NULL,
    [StartAtJourneyPatternPointId]                   DECIMAL (16)    NULL,
    [StartAtJourneyPatternPointGid]                  DECIMAL (16)    NULL,
    [StartAtJourneyPatternPointLocationCoordinate_1] DECIMAL (16, 2) NULL,
    [StartAtJourneyPatternPointLocationCoordinate_2] DECIMAL (16, 2) NULL,
    [EndAtJourneyPatternPointId]                     DECIMAL (16)    NULL,
    [EndAtJourneyPatternPointGid]                    DECIMAL (16)    NULL,
    [EndAtJourneyPatternPointLocationCoordinate_1]   DECIMAL (16, 2) NULL,
    [EndAtJourneyPatternPointLocationCoordinate_2]   DECIMAL (16, 2) NULL,
    [LengthMeters]                                   DECIMAL (12, 2) NULL,
    [ValidFromDate]                                  DATE            NULL,
    [ValidToDate]                                    DATE            NULL
);


GO

