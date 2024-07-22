CREATE TABLE [stg].[RT_SectionOfInterest_ChangeAnnouncement] (
    [SourceSystemEntryRef]         NVARCHAR (250)    NOT NULL,
    [DateOfAnnouncement]           DATE              NULL,
    [DateOfPhaseImpact]            DATE              NULL,
    [PhaseType]                    NVARCHAR (3)      NULL,
    [RouteLink]                    NVARCHAR (25)     NULL,
    [LineNumber]                   INT               NULL,
    [SectionOfInteresCode]         NVARCHAR (25)     NULL,
    [ChangedRouteLinkText]         NVARCHAR (250)    NULL,
    [RouteStartPoint]              INT               NULL,
    [RouteEndPoint]                INT               NULL,
    [SectionStartPoint]            INT               NULL,
    [SectionEndPoint]              INT               NULL,
    [RouteStartPointName]          NVARCHAR (100)    NULL,
    [RouteEndPointName]            NVARCHAR (100)    NULL,
    [SectionStartPointName]        NVARCHAR (100)    NULL,
    [SectionEndPointName]          NVARCHAR (100)    NULL,
    [RouteStartPointDisplayName]   NVARCHAR (100)    NULL,
    [RouteEndPointDisplayName]     NVARCHAR (100)    NULL,
    [SectionStartPointDisplayName] NVARCHAR (100)    NULL,
    [SectionEndPointDisplayName]   NVARCHAR (100)    NULL,
    [RouteStartPointGeography]     [sys].[geography] NULL,
    [RouteEndPointGeography]       [sys].[geography] NULL,
    [SectionStartPointGeography]   [sys].[geography] NULL,
    [SectionEndPointGeography]     [sys].[geography] NULL,
    [RouteStartPointCoordinate]    NVARCHAR (41)     NULL,
    [RouteEndPointCoordinate]      NVARCHAR (41)     NULL,
    [RouteLineString]              NVARCHAR (80)     NULL,
    [SectionStartPointCoordinate]  NVARCHAR (41)     NULL,
    [SectionEndPointCoordinate]    NVARCHAR (41)     NULL,
    [SectionLineString]            NVARCHAR (80)     NULL,
    [ChangedRouteLinkTextLong]     NVARCHAR (500)    NULL,
    [RouteGeographyLine]           [sys].[geography] NULL,
    [SectionGeographyLine]         [sys].[geography] NULL,
    [IsAnnounced]                  BIT               NULL,
    [DateOfAnnouncementMail]       DATETIME2 (3)     NULL,
    [LastChangeDateTime]           DATETIME2 (0)     NULL,
    CONSTRAINT [PK_RT_SectionOfInterest_ChangeAnnouncement] PRIMARY KEY NONCLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

CREATE CLUSTERED INDEX [RT_SectionOfInterest_ChangeAnnouncement]
    ON [stg].[RT_SectionOfInterest_ChangeAnnouncement]([SourceSystemEntryRef] ASC);


GO

