CREATE TABLE [data].[APC_OTS_Imputation_TimeGroupUniqueJourneyPatternPoint] (
    [TimeGroupUniqueJourneyPatternPointRef] NVARCHAR (50)  NOT NULL,
    [Period]                                INT            NOT NULL,
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
    [AlightingWeightAvg]                    DECIMAL (8, 7) NULL,
    [Published]                             BIT            CONSTRAINT [DF_APC_OTS_TimeUniqueJourneyPatternPointImputed_Published] DEFAULT ((0)) NOT NULL,
    [InsertedUtc]                           DATETIME2 (0)  NOT NULL,
    [UpdatedUtc]                            DATETIME2 (0)  NOT NULL,
    [Hash]                                  VARBINARY (32) NULL,
    CONSTRAINT [PK_APC_OTS_TimeUniqueJourneyPatternPointImputed] PRIMARY KEY CLUSTERED ([TimeGroupUniqueJourneyPatternPointRef] ASC)
);


GO

