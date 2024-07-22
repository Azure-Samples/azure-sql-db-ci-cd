CREATE TABLE [fact].[PAX_Productivity_LineMunicipalityPax] (
    [ScenarioKey]         INT              NOT NULL,
    [OperatingDayTypeKey] INT              NOT NULL,
    [DateKey]             INT              NOT NULL,
    [LineKey]             INT              NOT NULL,
    [MunicipalityKey]     INT              NOT NULL,
    [RateAreaKey]         INT              NOT NULL,
    [ServiceProviderID]   INT              NULL,
    [MunicipalityShare]   DECIMAL (13, 10) NULL,
    [PaxTotal]            DECIMAL (11, 2)  NULL,
    [PaxPerMunicipality]  DECIMAL (11, 2)  NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_PAX_Productivity_LineMunicipalityPax_Merge]
    ON [fact].[PAX_Productivity_LineMunicipalityPax]([ScenarioKey] ASC, [OperatingDayTypeKey] ASC, [DateKey] ASC, [LineKey] ASC, [MunicipalityKey] ASC, [RateAreaKey] ASC);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_PAX_Productivity_LineMunicipalityPax]
    ON [fact].[PAX_Productivity_LineMunicipalityPax];


GO

