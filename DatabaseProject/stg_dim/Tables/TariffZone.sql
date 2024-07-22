CREATE TABLE [stg_dim].[TariffZone] (
    [TariffZoneKey]           INT            NULL,
    [RateAreaKey]             INT            NULL,
    [ValidFromDateKey]        INT            NULL,
    [ValidToDateKey]          INT            NULL,
    [IsCurrent]               BIT            NULL,
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]     BIGINT         NULL,
    [RateAreaDisplayIndex]    INT            NULL,
    [RateAreaDisplayName]     NVARCHAR (250) NULL,
    [RateAreaCode]            NVARCHAR (20)  NULL,
    [RateAreaName]            NVARCHAR (250) NULL,
    [TariffZoneDisplayIndex]  INT            NULL,
    [TariffZoneDisplayName]   NVARCHAR (250) NULL,
    [TariffZoneCode]          NVARCHAR (20)  NULL,
    [TariffZoneName]          NVARCHAR (250) NULL,
    [TariffZoneNumber]        INT            NULL,
    [ValidFromDate]           DATE           NULL,
    [ValidToDate]             DATE           NULL,
    [LastModifiedUtcDateTime] DATETIME       NULL
);


GO

