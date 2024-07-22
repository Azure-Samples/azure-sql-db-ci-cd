CREATE TABLE [stg].[RT_DOI_JourneyPatternPoint] (
    [Id]                         NUMERIC (16)  NULL,
    [Gid]                        NUMERIC (16)  NULL,
    [Number]                     NUMERIC (8)   NULL,
    [StopPointId]                NUMERIC (9)   NULL,
    [RoadElementName]            NVARCHAR (50) NULL,
    [CoordinateSystemName]       NVARCHAR (50) NULL,
    [LocationNorthingCoordinate] VARCHAR (30)  NULL,
    [LocationEastingCoordinate]  VARCHAR (30)  NULL,
    [TransportAuthorityCode]     VARCHAR (8)   NULL,
    [TransportAuthorityNumber]   NUMERIC (3)   NULL,
    [ValidFromDate]              DATE          NULL,
    [ValidToDate]                DATE          NULL,
    [LastModifiedUtcDateTime]    DATETIME2 (3) NULL
);


GO

