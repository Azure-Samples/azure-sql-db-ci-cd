CREATE TABLE [data].[RT_VehicleTracker_Grid_KnnWeatherLocation] (
    [CellRef]     VARCHAR (20) NOT NULL,
    [LocationId]  INT          NOT NULL,
    [Distance]    FLOAT (53)   NULL,
    [K]           BIGINT       NULL,
    [DistanceSum] FLOAT (53)   NULL
);


GO

