CREATE TABLE [fact].[RT_SuppliedOperation_OLD] (
    [SuppliedOperatinKey]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [DateKey]                         INT              NULL,
    [ContractorKey]                   INT              NULL,
    [GarageKey]                       INT              NULL,
    [TimeKey]                         INT              NULL,
    [LineKey]                         INT              NULL,
    [JourneyPointRef]                 NVARCHAR (22)    NULL,
    [JourneyRef]                      NVARCHAR (18)    NULL,
    [OperatingDayDate]                DATE             NULL,
    [LineDesignation]                 NVARCHAR (8)     NULL,
    [LineDirectionCode]               NVARCHAR (1)     NULL,
    [ContractorCode]                  NVARCHAR (20)    NULL,
    [ContractorGarageCode]            NVARCHAR (20)    NULL,
    [StopPointId]                     INT              NULL,
    [MunicipalityKey]                 INT              NULL,
    [SequenceNumber]                  SMALLINT         NULL,
    [MaxSequenceNumber]               SMALLINT         NULL,
    [PlannedArrivalDateTime]          DATETIME2 (0)    NULL,
    [ObservedArrivalDateTime]         DATETIME2 (0)    NULL,
    [StopPointName]                   NVARCHAR (250)   NULL,
    [JourneyPatternPointLatitude]     DECIMAL (18, 12) NULL,
    [JourneyPatternPointLongitude]    DECIMAL (18, 12) NULL,
    [FrequencyType]                   SMALLINT         NULL,
    [K5]                              SMALLINT         NULL,
    [K2]                              SMALLINT         NULL,
    [PlannedDepartureDateTime]        DATETIME2 (0)    NULL,
    [Hour]                            SMALLINT         NULL,
    [StatusKeySharePerJourneyRef]     DECIMAL (18, 12) NULL,
    [StatusKeySharePerJourneyRef Alt] DECIMAL (18, 12) NULL,
    [K2_Status]                       NVARCHAR (50)    NULL,
    [K5_Status]                       NVARCHAR (50)    NULL,
    [FrequencyTypeText]               NVARCHAR (50)    NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_SuppliedOperation_JourneyPointRef]
    ON [fact].[RT_SuppliedOperation_OLD]([JourneyPointRef] ASC)
    INCLUDE([DateKey], [ContractorKey], [GarageKey], [TimeKey], [LineKey], [FrequencyTypeText], [PlannedDepartureDateTime], [Hour], [StatusKeySharePerJourneyRef], [StatusKeySharePerJourneyRef Alt], [K2_Status], [K5_Status], [StopPointName], [JourneyPatternPointLatitude], [JourneyPatternPointLongitude], [FrequencyType], [K5], [K2], [StopPointId], [MunicipalityKey], [SequenceNumber], [MaxSequenceNumber], [PlannedArrivalDateTime], [ObservedArrivalDateTime], [JourneyRef], [OperatingDayDate], [LineDesignation], [LineDirectionCode], [ContractorCode], [ContractorGarageCode]);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RT_SuppliedOperation]
    ON [fact].[RT_SuppliedOperation_OLD];


GO

