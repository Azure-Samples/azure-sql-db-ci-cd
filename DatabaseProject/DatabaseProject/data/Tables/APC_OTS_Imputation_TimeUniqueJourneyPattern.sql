CREATE TABLE [data].[APC_OTS_Imputation_TimeUniqueJourneyPattern] (
    [TimeUniqueJourneyPatternRef] NVARCHAR (50)  NOT NULL,
    [Period]                      INT            NOT NULL,
    [OperatingDayType]            SMALLINT       NOT NULL,
    [LineNumber]                  INT            NOT NULL,
    [LineDesignation]             NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]            NUMERIC (16)   NOT NULL,
    [DirectionCode]               INT            NOT NULL,
    [JourneyStartTime]            TIME (0)       NOT NULL,
    [JourneyCount]                INT            NOT NULL,
    [ImputationRule]              INT            NULL,
    [ObservedJourneyCount]        INT            NULL,
    [BoardingCountAvg]            DECIMAL (8, 2) NULL,
    [AlightingCountAvg]           DECIMAL (8, 2) NULL,
    [Published]                   BIT            CONSTRAINT [DF_APC_OTS_TimeUniqueJourneyPatternImputed_Published] DEFAULT ((0)) NOT NULL,
    [InsertedUtc]                 DATETIME2 (0)  NOT NULL,
    [UpdatedUtc]                  DATETIME2 (0)  NOT NULL,
    [Hash]                        VARBINARY (32) NULL,
    CONSTRAINT [PK_APC_OTS_TimeUniqueJourneyPatternImputed] PRIMARY KEY CLUSTERED ([TimeUniqueJourneyPatternRef] ASC)
);


GO

