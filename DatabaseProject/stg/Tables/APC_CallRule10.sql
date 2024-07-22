CREATE TABLE [stg].[APC_CallRule10] (
    [Period]                   INT            NOT NULL,
    [TypeOfDate]               SMALLINT       NOT NULL,
    [LineDesignation]          NVARCHAR (8)   NOT NULL,
    [JourneyPatternId]         NUMERIC (16)   NOT NULL,
    [JourneyPatternPointCount] INT            NOT NULL,
    [GroupByKey]               NVARCHAR (50)  NOT NULL,
    [JourneyCount]             INT            NOT NULL,
    [StopPointNumber]          INT            NULL,
    [SequenceNumber]           TINYINT        NOT NULL,
    [TimeGroup]                NVARCHAR (1)   NOT NULL,
    [CallEnumerationRule]      INT            NULL,
    [BoardersWeightAvg]        DECIMAL (8, 7) NULL,
    [AlightersWeightAvg]       DECIMAL (8, 7) NULL,
    CONSTRAINT [PK_APC_CallRule10_1] PRIMARY KEY CLUSTERED ([Period] ASC, [TypeOfDate] ASC, [JourneyPatternId] ASC, [SequenceNumber] ASC, [TimeGroup] ASC)
);


GO

