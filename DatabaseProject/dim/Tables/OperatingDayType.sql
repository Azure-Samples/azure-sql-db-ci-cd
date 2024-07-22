CREATE TABLE [dim].[OperatingDayType] (
    [OperatingDayTypeKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]            INT            NOT NULL,
    [ValidToDateKey]              INT            NOT NULL,
    [IsCurrent]                   BIT            NOT NULL,
    [SourceSystemCode]            NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]         BIGINT         NULL,
    [OperatingDayTypeNumber]      INT            NOT NULL,
    [OperatingDayTypeName]        NVARCHAR (250) NOT NULL,
    [OperatingDayTypeDisplayName] NVARCHAR (250) NOT NULL,
    [ValidFromDate]               DATE           NOT NULL,
    [ValidToDate]                 DATE           NULL,
    CONSTRAINT [PK_OperatingDayType] PRIMARY KEY CLUSTERED ([OperatingDayTypeKey] ASC),
    CONSTRAINT [BK_OperatingDayType] UNIQUE NONCLUSTERED ([OperatingDayTypeNumber] ASC)
);


GO

