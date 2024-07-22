CREATE TABLE [data].[RT_VehicleTracker_MatrixSpecialDay] (
    [Date]                            DATE           NOT NULL,
    [DateKey]                         INT            NOT NULL,
    [Hour]                            INT            NOT NULL,
    [LinkRef]                         NVARCHAR (20)  NOT NULL,
    [SpecialDay]                      BIT            NOT NULL,
    [DayType]                         NVARCHAR (255) NOT NULL,
    [DataPointCount]                  INT            NULL,
    [LinkTravelTimeMean]              FLOAT (53)     NULL,
    [LinkSpecialDayDataPointCoverage] FLOAT (53)     NULL,
    [LinkNormalDayDataPointCoverage]  FLOAT (53)     NULL
);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RT_VehicleTracker_MatrixSpecialDay]
    ON [data].[RT_VehicleTracker_MatrixSpecialDay];


GO

