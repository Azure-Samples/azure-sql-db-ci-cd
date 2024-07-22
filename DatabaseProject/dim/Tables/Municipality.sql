CREATE TABLE [dim].[Municipality] (
    [MunicipalityKey]             INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]            INT            NOT NULL,
    [ValidToDateKey]              INT            NOT NULL,
    [IsCurrent]                   BIT            NOT NULL,
    [SourceSystemCode]            NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]         BIGINT         NULL,
    [MunicipalityCode]            NVARCHAR (20)  NULL,
    [MunicipalityName]            NVARCHAR (250) NOT NULL,
    [MunicipalityDisplayIndex]    INT            NOT NULL,
    [MunicipalityDisplayName]     NVARCHAR (250) NOT NULL,
    [ValidFromDate]               DATE           NULL,
    [ValidToDate]                 DATE           NULL,
    [TrafficPlanAreaKey]          INT            CONSTRAINT [DF_Municipality_TrafficPlanAreaKey] DEFAULT ((-1)) NOT NULL,
    [TrafficPlanAreaCode]         NVARCHAR (20)  NULL,
    [TrafficPlanAreaName]         NVARCHAR (250) CONSTRAINT [DF_Municipality_TrafficPlanAreaName] DEFAULT ((-1)) NOT NULL,
    [TrafficPlanAreaDisplayIndex] INT            CONSTRAINT [DF_Municipality_TrafficPlanAreaDisplayIndex] DEFAULT ((-1)) NOT NULL,
    [TrafficPlanAreaDisplayName]  NVARCHAR (250) CONSTRAINT [DF_Municipality_TrafficPlanAreaDisplayName] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_Municipality] PRIMARY KEY CLUSTERED ([MunicipalityKey] ASC)
);


GO

