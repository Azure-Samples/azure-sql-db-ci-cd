CREATE TABLE [stg].[APC_OTS_Imputation_TimeGroupUniqueJourneyPatternPoint] (
    [TimeGroupUniqueJourneyPatternPointRef] NVARCHAR (50)  NULL,
    [period]                                INT            NOT NULL,
    [OperatingDayType]                      SMALLINT       NOT NULL,
    [LineNumber]                            INT            NOT NULL,
    [LineDesignation]                       NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]                      NUMERIC (16)   NOT NULL,
    [DirectionCode]                         INT            NOT NULL,
    [StartJourneyPatternPointNumber]        INT            NOT NULL,
    [JourneyPatternPointCount]              INT            NOT NULL,
    [JourneyStartTime]                      TIME (0)       NOT NULL,
    [JourneyCount]                          INT            NOT NULL,
    [StopPointNumber]                       INT            NULL,
    [SequenceNumber]                        TINYINT        NULL,
    [TimeGroup]                             NVARCHAR (1)   NULL,
    [ImputationRule]                        INT            NULL,
    [BoardingWeightAvg]                     DECIMAL (8, 7) NULL,
    [AlightingWeightAvg]                    DECIMAL (8, 7) NULL
);


GO

