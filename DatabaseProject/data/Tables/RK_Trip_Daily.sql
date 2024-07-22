CREATE TABLE [data].[RK_Trip_Daily] (
    [TripDate]                   DATE            NULL,
    [TripStartTime]              TIME (0)        NULL,
    [TripEndTime]                TIME (0)        NULL,
    [TripPrice]                  NUMERIC (18, 2) NULL,
    [TotalCount]                 TINYINT         NULL,
    [YoungsterCount]             TINYINT         NULL,
    [AdultCount]                 TINYINT         NULL,
    [ChildCount]                 TINYINT         NULL,
    [BicycleCount]               TINYINT         NULL,
    [Handicap]                   TINYINT         NULL,
    [DogCount]                   TINYINT         NULL,
    [SeniorCount]                TINYINT         NULL,
    [ZoneCount]                  SMALLINT        NULL,
    [PaidZoneCount]              SMALLINT        NULL,
    [DiscountLevel]              TINYINT         NULL,
    [StartStopPointId]           INT             NULL,
    [StartStopPointName]         VARCHAR (255)   NULL,
    [EndStopPointId]             INT             NULL,
    [EndStopPointName]           VARCHAR (255)   NULL,
    [SoloCombiTrip]              VARCHAR (20)    NULL,
    [CardType]                   VARCHAR (20)    NULL,
    [Region]                     VARCHAR (20)    NULL,
    [PtoCombination]             VARCHAR (50)    NULL,
    [RateSet]                    VARCHAR (255)   NULL,
    [RateAreaCombination]        VARCHAR (255)   NULL,
    [ValidationModelCombination] VARCHAR (20)    NULL,
    [ModalCombination]           VARCHAR (20)    NULL,
    [RouteCombination]           VARCHAR (255)   NULL,
    [TripRef]                    VARCHAR (20)    NULL,
    [Inserted]                   DATETIME2 (0)   NULL,
    [Updated]                    DATETIME2 (0)   NULL,
    [Hash]                       BINARY (32)     NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RK_Trip_Daily]
    ON [data].[RK_Trip_Daily]([TripRef] ASC)
    INCLUDE([Hash]);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RK_Trip_Daily]
    ON [data].[RK_Trip_Daily];


GO

