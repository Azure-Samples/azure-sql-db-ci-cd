CREATE TABLE [fact].[RT_SignalPriority_ActivationAgg] (
    [JourneyPatternKey]  INT            NOT NULL,
    [ActivationPointKey] INT            NOT NULL,
    [DateKey]            INT            NOT NULL,
    [SourceSystemCode]   VARCHAR (20)   NOT NULL,
    [NoOfJourneys]       INT            NULL,
    [Inserted]           DATETIME2 (0)  NULL,
    [Updated]            DATETIME2 (0)  NULL,
    [Hash]               VARBINARY (32) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_SignalPriority_ActivationAgg_Merge]
    ON [fact].[RT_SignalPriority_ActivationAgg]([JourneyPatternKey] ASC, [ActivationPointKey] ASC, [DateKey] ASC, [SourceSystemCode] ASC);


GO

