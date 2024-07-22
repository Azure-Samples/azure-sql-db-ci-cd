CREATE TABLE [stg].[GIS_StopPoint] (
    [StopPointId]           INT               NULL,
    [ValidFromDate]         DATE              NULL,
    [ValidToDate]           DATE              NULL,
    [StopPointName]         NVARCHAR (255)    NULL,
    [StopPointRoadName]     NVARCHAR (255)    NULL,
    [StopPointAbbreviation] NVARCHAR (20)     NULL,
    [StopPointPositionX]    FLOAT (53)        NULL,
    [StopPointPositionY]    FLOAT (53)        NULL,
    [StopPointGeography]    [sys].[geography] NULL,
    [SourceSystemCode]      NVARCHAR (20)     NULL,
    [SourceSystemEntryRef]  NVARCHAR (20)     NULL
);


GO

