CREATE TABLE [data].[RT_DOI_JourneyPatternPoint] (
    [Id]                         NUMERIC (16)  NOT NULL,
    [Gid]                        NUMERIC (16)  NOT NULL,
    [Number]                     NUMERIC (8)   NOT NULL,
    [StopPointId]                NUMERIC (9)   NULL,
    [RoadElementName]            NVARCHAR (50) NULL,
    [CoordinateSystemName]       NVARCHAR (50) NULL,
    [LocationNorthingCoordinate] VARCHAR (30)  NULL,
    [LocationEastingCoordinate]  VARCHAR (30)  NULL,
    [TransportAuthorityCode]     VARCHAR (8)   NOT NULL,
    [TransportAuthorityNumber]   NUMERIC (3)   NOT NULL,
    [ValidFromDate]              DATE          NOT NULL,
    [ValidToDate]                DATE          NULL,
    [LastModifiedUtcDateTime]    DATETIME2 (3) NOT NULL,
    CONSTRAINT [PK_RT_DOI_JourneyPatternPoint] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [RT_DOI_JourneyPatternPoint_Gid_ValidFromDate_ValidToDate]
    ON [data].[RT_DOI_JourneyPatternPoint]([Gid] ASC, [ValidFromDate] ASC, [ValidToDate] ASC)
    INCLUDE([CoordinateSystemName], [Id], [LastModifiedUtcDateTime], [LocationEastingCoordinate], [LocationNorthingCoordinate], [Number], [RoadElementName], [StopPointId], [TransportAuthorityCode], [TransportAuthorityNumber]);


GO

