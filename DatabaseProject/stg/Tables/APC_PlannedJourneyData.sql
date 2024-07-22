CREATE TABLE [stg].[APC_PlannedJourneyData] (
    [OperatingDayDate]                      DATE           NOT NULL,
    [CallId]                                CHAR (23)      NOT NULL,
    [Date]                                  DATE           NOT NULL,
    [TypeOfDate]                            TINYINT        NOT NULL,
    [LineDesignation]                       NVARCHAR (8)   NOT NULL,
    [JourneyGid]                            DECIMAL (16)   NOT NULL,
    [DirectionGid]                          DECIMAL (16)   NOT NULL,
    [DirectionDescription]                  NVARCHAR (255) NULL,
    [JourneyPatternId]                      DECIMAL (16)   NOT NULL,
    [SequenceNumber]                        TINYINT        NOT NULL,
    [JourneyPatternPointGid]                DECIMAL (16)   NOT NULL,
    [StopName]                              VARCHAR (100)  NOT NULL,
    [LocatingCoordinate1]                   NVARCHAR (30)  NOT NULL,
    [LocatingCoordinate2]                   NVARCHAR (30)  NOT NULL,
    [PrimaryDestinationName]                NVARCHAR (50)  NOT NULL,
    [SecondaryDestinationName]              NVARCHAR (50)  NULL,
    [JourneyStartTime]                      DATETIME       NOT NULL,
    [StartJourneyPatternPointGid]           DECIMAL (16)   NOT NULL,
    [JourneyEndTime]                        DATETIME       NOT NULL,
    [EndJourneyPatternPointGid]             DECIMAL (16)   NOT NULL,
    [PlannedArrivalAtJourneyPatternPoint]   DATETIME       NOT NULL,
    [ArrivalTypeOfCall]                     TINYINT        NOT NULL,
    [PlannedDepartureAtJourneyPatternPoint] DATETIME       NOT NULL,
    [DepartureTypeOfCall]                   TINYINT        NOT NULL,
    [PreviousJourneyPatternPointGid]        DECIMAL (16)   NULL,
    [TypeOfStop]                            NVARCHAR (8)   NOT NULL,
    [VehicleGid]                            DECIMAL (16)   NULL,
    [ContractorCode]                        NVARCHAR (20)  NULL,
    [Operator]                              NVARCHAR (50)  NULL,
    [ContractorGarageCode]                  NVARCHAR (20)  NULL,
    [Garage]                                NVARCHAR (50)  NULL
);


GO

