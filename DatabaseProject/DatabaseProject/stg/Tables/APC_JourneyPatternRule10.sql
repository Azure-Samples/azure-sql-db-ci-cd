CREATE TABLE [stg].[APC_JourneyPatternRule10] (
    [Period]           INT            NOT NULL,
    [TypeOfDate]       SMALLINT       NOT NULL,
    [LineDesignation]  NVARCHAR (8)   NULL,
    [JourneyStartTime] TIME (0)       NOT NULL,
    [JourneyPatternId] NUMERIC (16)   NOT NULL,
    [GroupByKey]       NVARCHAR (50)  NOT NULL,
    [JourneyCount]     INT            NOT NULL,
    [BoardersAvg]      DECIMAL (8, 2) NULL,
    [AlightersAvg]     DECIMAL (8, 2) NULL,
    CONSTRAINT [PK_APC_JourneyPatternRule10_1] PRIMARY KEY CLUSTERED ([Period] ASC, [TypeOfDate] ASC, [JourneyPatternId] ASC, [JourneyStartTime] ASC)
);


GO

