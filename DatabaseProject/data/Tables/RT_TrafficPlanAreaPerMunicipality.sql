CREATE TABLE [data].[RT_TrafficPlanAreaPerMunicipality] (
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]     BIGINT         NULL,
    [TrafficPlanAreaCode]     NVARCHAR (20)  NULL,
    [MunicipalityCode]        NVARCHAR (20)  NULL,
    [MunicipalityName]        NVARCHAR (250) NULL,
    [ValidFromDate]           DATE           NULL,
    [ValidToDate]             DATE           NULL,
    [LastModifiedUtcDateTime] DATETIME       NULL
);


GO

