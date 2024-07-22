CREATE TABLE [data].[GIS_Garage] (
    [GarageCode]     NVARCHAR (20)     NOT NULL,
    [ValidFromDate]  DATE              NOT NULL,
    [ValidToDate]    DATE              NULL,
    [ContractorCode] NVARCHAR (20)     NULL,
    [Geography]      [sys].[geography] NULL,
    CONSTRAINT [PK_GIS_Garage] PRIMARY KEY CLUSTERED ([GarageCode] ASC, [ValidFromDate] ASC)
);


GO

CREATE SPATIAL INDEX [SPIX_Geography]
    ON [data].[GIS_Garage] ([Geography])
    WITH  (
            CELLS_PER_OBJECT = 16
          );


GO

