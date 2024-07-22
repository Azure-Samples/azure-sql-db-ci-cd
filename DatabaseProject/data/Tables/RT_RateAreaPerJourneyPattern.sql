CREATE TABLE [data].[RT_RateAreaPerJourneyPattern] (
    [JourneyPatternId]        BIGINT        NOT NULL,
    [RateAreaCode]            NVARCHAR (20) NOT NULL,
    [ValidFromDate]           DATE          NOT NULL,
    [ValidToDate]             DATE          NULL,
    [RateAreaCombinationCode] NVARCHAR (20) NOT NULL,
    [Overridden]              BIT           CONSTRAINT [DF_RT_RateAreaPerJourneyPattern_Overridden] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RT_RateAreaPerJourneyPattern] PRIMARY KEY CLUSTERED ([JourneyPatternId] ASC, [RateAreaCode] ASC, [ValidFromDate] ASC)
);


GO

