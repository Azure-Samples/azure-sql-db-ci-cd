CREATE TABLE [stg_fact].[PAX_Productivity_LineMunicipalityPax] (
    [ScenarioKey]          INT              NULL,
    [ScenarioCode]         NVARCHAR (20)    NULL,
    [ScenarioName]         NVARCHAR (30)    NULL,
    [ScenarioKindName]     NVARCHAR (30)    NULL,
    [OperatingDayTypeName] NVARCHAR (30)    NULL,
    [OperatingDayTypeKey]  INT              NULL,
    [Month]                NVARCHAR (30)    NULL,
    [Year]                 INT              NULL,
    [DateKey]              INT              NULL,
    [YearMonthNo]          INT              NULL,
    [LineKey]              INT              NULL,
    [LineDesignation]      NVARCHAR (20)    NULL,
    [LineNumber]           NVARCHAR (20)    NULL,
    [MunicipalityKey]      INT              NULL,
    [MunicipalityCode]     INT              NULL,
    [RateAreaKey]          INT              NULL,
    [RateAreaName]         NVARCHAR (30)    NULL,
    [ServiceProviderID]    INT              NULL,
    [TransportModeName]    NVARCHAR (10)    NULL,
    [MunicipalityShare]    DECIMAL (13, 10) NULL,
    [PaxTotal]             DECIMAL (11, 2)  NULL,
    [PaxPerMunicipality]   DECIMAL (11, 2)  NULL
);


GO

