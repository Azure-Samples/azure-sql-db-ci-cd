CREATE TABLE [data].[GIS_TariffZoneDistance] (
    [FromZoneRef]          NVARCHAR (20) NOT NULL,
    [ToZoneRef]            NVARCHAR (20) NOT NULL,
    [ValidFromDate]        DATE          NOT NULL,
    [ValidToDate]          DATE          NULL,
    [Distance]             INT           NOT NULL,
    [SourceSystemCode]     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (20) NOT NULL,
    CONSTRAINT [PK_GIS_TariffZoneDistance] PRIMARY KEY CLUSTERED ([FromZoneRef] ASC, [ToZoneRef] ASC, [ValidFromDate] ASC)
);


GO

