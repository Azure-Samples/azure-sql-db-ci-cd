CREATE TABLE [data].[GIS_Municipality] (
    [MunicipalityCode]      NVARCHAR (20)     NOT NULL,
    [MunicipalityGeography] [sys].[geography] NULL,
    CONSTRAINT [PK_GIS_Municipality] PRIMARY KEY CLUSTERED ([MunicipalityCode] ASC)
);


GO

