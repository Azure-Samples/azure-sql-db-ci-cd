CREATE TABLE [stg_fact].[RT_SignalPriority_ActivationAgg] (
    [JourneyPatternKey]  INT          NOT NULL,
    [ActivationPointKey] INT          NOT NULL,
    [DateKey]            INT          NOT NULL,
    [SourceSystemCode]   VARCHAR (20) NULL,
    [NoOfJourneys]       INT          NULL
);


GO

