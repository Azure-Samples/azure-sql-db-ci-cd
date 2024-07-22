CREATE TABLE [data].[GIS_Grid] (
    [CellRef]   VARCHAR (20)      NOT NULL,
    [GridRef]   VARCHAR (20)      NOT NULL,
    [Geometry]  [sys].[geometry]  NOT NULL,
    [Geography] [sys].[geography] NOT NULL,
    CONSTRAINT [PK_GIS_Grid] PRIMARY KEY CLUSTERED ([CellRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_GIS_Grid_GridRef]
    ON [data].[GIS_Grid]([GridRef] ASC);


GO

CREATE SPATIAL INDEX [SPIX_GIS_Grid_Geography]
    ON [data].[GIS_Grid] ([Geography])
    WITH  (
            CELLS_PER_OBJECT = 8
          );


GO

