CREATE TABLE [data].[GIS_TariffZoneAdjacent] (
    [FromZoneRef]          NVARCHAR (20) NOT NULL,
    [ToZoneRef]            NVARCHAR (20) NOT NULL,
    [ValidFromDate]        DATE          NOT NULL,
    [ValidToDate]          DATE          NULL,
    [SourceSystemCode]     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_GIS_TariffZoneAdjacent] PRIMARY KEY CLUSTERED ([FromZoneRef] ASC, [ToZoneRef] ASC, [ValidFromDate] ASC)
);


GO

