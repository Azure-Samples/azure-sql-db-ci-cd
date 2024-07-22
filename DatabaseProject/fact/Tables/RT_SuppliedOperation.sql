CREATE TABLE [fact].[RT_SuppliedOperation] (
    [DateKey]                         INT              NULL,
    [ContractorKey]                   INT              NULL,
    [GarageKey]                       INT              NULL,
    [TimeKey]                         INT              NULL,
    [LineKey]                         INT              NULL,
    [K2StatusKey]                     SMALLINT         NULL,
    [K5StatusKey]                     SMALLINT         NULL,
    [FrequencyTypeKey]                INT              NULL,
    [JourneyPatternKey]               INT              NULL,
    [StopPointKey]                    INT              NULL,
    [MunicipalityKey]                 INT              NULL,
    [JourneyRef]                      NVARCHAR (18)    NULL,
    [OperatingDayDate]                DATE             NULL,
    [StopPointId]                     INT              NULL,
    [SequenceNumber]                  SMALLINT         NULL,
    [MaxSequenceNumber]               SMALLINT         NULL,
    [PlannedArrivalDateTime]          DATETIME2 (0)    NULL,
    [ObservedArrivalDateTime]         DATETIME2 (0)    NULL,
    [FrequencyType]                   SMALLINT         NULL,
    [K2]                              SMALLINT         NULL,
    [K5]                              SMALLINT         NULL,
    [PlannedDepartureDateTime]        DATETIME2 (0)    NULL,
    [Hour]                            SMALLINT         NULL,
    [StatusKeySharePerJourneyRef]     DECIMAL (18, 12) NULL,
    [StatusKeySharePerJourneyRef Alt] DECIMAL (18, 12) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_SuppliedOperation_JourneyRef_SequenceNumber_TimeKey]
    ON [fact].[RT_SuppliedOperation]([JourneyRef] ASC, [SequenceNumber] ASC, [TimeKey] ASC);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RT_SuppliedOperation]
    ON [fact].[RT_SuppliedOperation];


GO

