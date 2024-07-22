CREATE TABLE [stg_dim].[Garage] (
    [GarageKey]           INT            NULL,
    [IsCurrent]           BIT            NULL,
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] BIGINT         NULL,
    [GarageCode]          NVARCHAR (20)  NULL,
    [GarageName]          NVARCHAR (250) NULL,
    [ValidFromDate]       DATE           NULL,
    [ValidToDate]         DATE           NULL,
    [Address]             NVARCHAR (100) NULL
);


GO

