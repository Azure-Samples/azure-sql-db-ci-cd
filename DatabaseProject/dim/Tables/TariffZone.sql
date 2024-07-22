CREATE TABLE [dim].[TariffZone] (
    [TariffZoneKey]           INT            IDENTITY (1, 1) NOT NULL,
    [RateAreaKey]             INT            NOT NULL,
    [ValidFromDateKey]        INT            NOT NULL,
    [ValidToDateKey]          INT            NOT NULL,
    [IsCurrent]               BIT            NOT NULL,
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]     BIGINT         NULL,
    [RateAreaDisplayIndex]    INT            NOT NULL,
    [RateAreaDisplayName]     NVARCHAR (250) NOT NULL,
    [RateAreaCode]            NVARCHAR (20)  NULL,
    [RateAreaName]            NVARCHAR (250) NULL,
    [TariffZoneDisplayIndex]  INT            NOT NULL,
    [TariffZoneDisplayName]   NVARCHAR (250) NOT NULL,
    [TariffZoneCode]          NVARCHAR (20)  NULL,
    [TariffZoneName]          NVARCHAR (250) NULL,
    [TariffZoneNumber]        INT            NULL,
    [ValidFromDate]           DATE           NULL,
    [ValidToDate]             DATE           NULL,
    [LastModifiedUtcDateTime] DATETIME       NULL,
    CONSTRAINT [PK_TariffZone] PRIMARY KEY CLUSTERED ([TariffZoneKey] ASC)
);


GO

