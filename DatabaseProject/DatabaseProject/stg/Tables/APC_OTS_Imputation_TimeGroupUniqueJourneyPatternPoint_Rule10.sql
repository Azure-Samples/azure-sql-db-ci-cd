CREATE TABLE [stg].[APC_OTS_Imputation_TimeGroupUniqueJourneyPatternPoint_Rule10] (
    [Period]                   INT            NOT NULL,
    [OperatingDayType]         SMALLINT       NOT NULL,
    [LineDesignation]          NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]         NVARCHAR (17)  NOT NULL,
    [JourneyPatternPointCount] INT            NOT NULL,
    [GroupByKey]               NVARCHAR (50)  NOT NULL,
    [JourneyCount]             INT            NOT NULL,
    [StopPointNumber]          INT            NULL,
    [SequenceNumber]           TINYINT        NOT NULL,
    [TimeGroup]                NVARCHAR (1)   NOT NULL,
    [ImputationRule]           INT            NULL,
    [BoardingWeightAvg]        DECIMAL (8, 7) NULL,
    [AlightingWeightAvg]       DECIMAL (8, 7) NULL,
    CONSTRAINT [PK_APC_OTS_Imputation_TimeUniqueJourneyPatternPoint_Rule10] PRIMARY KEY CLUSTERED ([Period] ASC, [OperatingDayType] ASC, [JourneyPatternId] ASC, [SequenceNumber] ASC, [TimeGroup] ASC)
);


GO

