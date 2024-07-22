CREATE TABLE [dim].[TrafficPlanArea] (
    [TrafficPlanAreaKey]          INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]            INT            NOT NULL,
    [ValidToDateKey]              INT            NOT NULL,
    [IsCurrent]                   BIT            NOT NULL,
    [SourceSystemCode]            NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]         BIGINT         NULL,
    [TrafficPlanAreaCode]         NVARCHAR (20)  NULL,
    [TrafficPlanAreaName]         NVARCHAR (250) NOT NULL,
    [TrafficPlanAreaDisplayIndex] INT            NOT NULL,
    [TrafficPlanAreaDisplayName]  NVARCHAR (250) NOT NULL,
    [ValidFromDate]               DATE           NULL,
    [ValidToDate]                 DATE           NULL,
    CONSTRAINT [PK_TrafficPlanArea] PRIMARY KEY CLUSTERED ([TrafficPlanAreaKey] ASC)
);


GO

