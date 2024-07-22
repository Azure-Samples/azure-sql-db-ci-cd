CREATE TABLE [data].[APC_CountingData] (
    [CallKey]                               CHAR (23)       NOT NULL,
    [Date]                                  DATE            NOT NULL,
    [TypeOfDate]                            TINYINT         NOT NULL,
    [LineDesignation]                       NVARCHAR (8)    NOT NULL,
    [JourneyGid]                            DECIMAL (16)    NOT NULL,
    [DirectionGid]                          DECIMAL (16)    NOT NULL,
    [DirectionDescription]                  NVARCHAR (255)  NULL,
    [JourneyPatternId]                      DECIMAL (16)    NOT NULL,
    [SequenceNumber]                        TINYINT         NOT NULL,
    [JourneyPatternPointGid]                DECIMAL (16)    NOT NULL,
    [StopName]                              VARCHAR (100)   NOT NULL,
    [LocatingCoordinate1]                   NVARCHAR (30)   NOT NULL,
    [LocatingCoordinate2]                   NVARCHAR (30)   NOT NULL,
    [PrimaryDestinationName]                NVARCHAR (50)   NOT NULL,
    [SecondaryDestinationName]              NVARCHAR (50)   NULL,
    [JourneyStartTime]                      DATETIME        NOT NULL,
    [StartJourneyPatternPointGid]           DECIMAL (16)    NOT NULL,
    [JourneyEndTime]                        DATETIME        NOT NULL,
    [EndJourneyPatternPointGid]             DECIMAL (16)    NOT NULL,
    [PlannedArrivalAtJourneyPatternPoint]   DATETIME        NOT NULL,
    [ArrivalTypeOfCall]                     TINYINT         NOT NULL,
    [PlannedDepartureAtJourneyPatternPoint] DATETIME        NOT NULL,
    [DepartureTypeOfCall]                   TINYINT         NOT NULL,
    [Distance]                              DECIMAL (10, 2) NULL,
    [TypeOfStop]                            NVARCHAR (8)    NOT NULL,
    [VehicleGid]                            DECIMAL (16)    NULL,
    [Operator]                              NVARCHAR (50)   NOT NULL,
    [Garage]                                NVARCHAR (50)   NOT NULL,
    [BusID]                                 VARCHAR (4)     NULL,
    [Ready]                                 TINYINT         NOT NULL,
    [FilterReasons]                         NVARCHAR (10)   NULL,
    [StopArrival]                           DATETIME        NULL,
    [StopDeparture]                         DATETIME        NULL,
    [TerminusDeparture]                     DATETIME        NULL,
    [TerminusArrival]                       DATETIME        NULL,
    [Door1Boarders]                         INT             NULL,
    [Door1Alighters]                        INT             NULL,
    [Door2Boarders]                         INT             NULL,
    [Door2Alighters]                        INT             NULL,
    [Door3Boarders]                         INT             NULL,
    [Door3Alighters]                        INT             NULL,
    [Door4Boarders]                         INT             NULL,
    [Door4Alighters]                        INT             NULL,
    [Door5Boarders]                         INT             NULL,
    [Door5Alighters]                        INT             NULL,
    [TotalBoarders]                         INT             NULL,
    [TotalAlighters]                        INT             NULL,
    CONSTRAINT [PK_APC_CoutingData] PRIMARY KEY CLUSTERED ([CallKey] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_APC_CountingData_TypeOfDate_Ready_Date]
    ON [data].[APC_CountingData]([TypeOfDate] ASC, [Ready] ASC, [Date] ASC)
    INCLUDE([LineDesignation], [JourneyPatternId], [JourneyStartTime], [Operator]);


GO

CREATE NONCLUSTERED INDEX [IX_APC_CountingData_Ready_BusID]
    ON [data].[APC_CountingData]([Ready] ASC, [BusID] ASC)
    INCLUDE([JourneyGid], [JourneyPatternId], [JourneyStartTime], [TotalBoarders], [TotalAlighters]);


GO

