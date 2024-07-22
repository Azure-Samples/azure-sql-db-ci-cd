CREATE TABLE [stg_dim].[Municipality] (
    [MunicipalityKey]             INT            NULL,
    [IsCurrent]                   BIT            NULL,
    [SourceSystemCode]            NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]         BIGINT         NULL,
    [MunicipalityCode]            NVARCHAR (20)  NULL,
    [MunicipalityName]            NVARCHAR (250) NULL,
    [MunicipalityDisplayIndex]    INT            NULL,
    [MunicipalityDisplayName]     NVARCHAR (250) NULL,
    [ValidFromDate]               DATE           NULL,
    [ValidToDate]                 DATE           NULL,
    [TrafficPlanAreaKey]          INT            NULL,
    [TrafficPlanAreaCode]         NVARCHAR (20)  NULL,
    [TrafficPlanAreaName]         NVARCHAR (250) NULL,
    [TrafficPlanAreaDisplayIndex] INT            NULL,
    [TrafficPlanAreaDisplayName]  NVARCHAR (250) NULL
);


GO

