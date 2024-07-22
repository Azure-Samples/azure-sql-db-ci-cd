CREATE TABLE [data].[GIS_StopPoint] (
    [StopPointId]           INT               NOT NULL,
    [ValidFromDate]         DATE              NOT NULL,
    [ValidToDate]           DATE              NULL,
    [StopPointName]         NVARCHAR (255)    NULL,
    [StopPointRoadName]     NVARCHAR (255)    NULL,
    [StopPointAbbreviation] NVARCHAR (20)     NULL,
    [StopPointPositionX]    FLOAT (53)        NULL,
    [StopPointPositionY]    FLOAT (53)        NULL,
    [StopPointGeography]    [sys].[geography] NULL,
    [SourceSystemCode]      NVARCHAR (20)     NULL,
    [SourceSystemEntryRef]  NVARCHAR (20)     NULL,
    CONSTRAINT [PK_GIS_StopPoint] PRIMARY KEY CLUSTERED ([StopPointId] ASC, [ValidFromDate] ASC)
);


GO

