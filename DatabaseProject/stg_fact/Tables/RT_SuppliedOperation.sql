CREATE TABLE [stg_fact].[RT_SuppliedOperation] (
    [DateKey]                         INT              NULL,
    [ContractorKey]                   INT              NULL,
    [GarageKey]                       INT              NULL,
    [TimeKey]                         INT              NULL,
    [LineKey]                         INT              NULL,
    [K2StatusKey]                     INT              NULL,
    [K5StatusKey]                     INT              NULL,
    [FrequencyTypeKey]                INT              NULL,
    [JourneyPatternKey]               INT              NULL,
    [StopPointKey]                    INT              NULL,
    [MunicipalityKey]                 INT              NULL,
    [JourneyPatternId]                BIGINT           NULL,
    [JourneyRef]                      NVARCHAR (18)    NULL,
    [OperatingDayDate]                DATE             NULL,
    [LineDesignation]                 VARCHAR (8)      NULL,
    [LineDirectionCode]               NCHAR (1)        NULL,
    [ContractorCode]                  NVARCHAR (20)    NULL,
    [ContractorGarageCode]            NVARCHAR (20)    NULL,
    [StopPointId]                     INT              NULL,
    [SequenceNumber]                  SMALLINT         NULL,
    [MaxSequenceNumber]               SMALLINT         NULL,
    [PlannedArrivalDateTime]          DATETIME2 (0)    NULL,
    [ObservedArrivalDateTime]         DATETIME2 (0)    NULL,
    [StopPointName]                   NVARCHAR (250)   NULL,
    [JourneyPatternPointLatitude]     DECIMAL (18, 12) NULL,
    [JourneyPatternPointLongitude]    DECIMAL (18, 12) NULL,
    [FrequencyType]                   SMALLINT         NULL,
    [K2]                              SMALLINT         NULL,
    [K5]                              SMALLINT         NULL,
    [PlannedDepartureDateTime]        DATETIME2 (0)    NULL,
    [Hour]                            SMALLINT         NULL,
    [StatusKeySharePerJourneyRef]     DECIMAL (18, 12) NULL,
    [StatusKeySharePerJourneyRef Alt] DECIMAL (18, 12) NULL
);


GO

