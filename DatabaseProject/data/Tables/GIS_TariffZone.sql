CREATE TABLE [data].[GIS_TariffZone] (
    [ZoneRef]                  NVARCHAR (20)     NOT NULL,
    [ValidFromDate]            DATE              NOT NULL,
    [ValidToDate]              DATE              NULL,
    [SourceSystemCode]         NVARCHAR (20)     NULL,
    [SourceSystemEntryRef]     NVARCHAR (20)     NULL,
    [SourceSystemEntryCreated] DATETIME2 (0)     NULL,
    [ZoneNumber]               INT               NULL,
    [ZoneName]                 NVARCHAR (250)    NULL,
    [OriginalZoneGeometry]     [sys].[geometry]  NULL,
    [OriginalZoneGeography]    [sys].[geography] NULL,
    [ZoneGeography]            [sys].[geography] NULL,
    CONSTRAINT [PK_GIS_TariffZone] PRIMARY KEY CLUSTERED ([ZoneRef] ASC, [ValidFromDate] ASC)
);


GO

