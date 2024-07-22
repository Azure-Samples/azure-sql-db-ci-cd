CREATE TABLE [fact].[RT_SignalPriority_ExpectedActivationAgg] (
    [JourneyPatternKey]  INT            NOT NULL,
    [ActivationPointKey] INT            NOT NULL,
    [DateKey]            INT            NOT NULL,
    [NoOfJourneys]       INT            NULL,
    [NoOfObserved]       INT            NULL,
    [Inserted]           DATETIME2 (0)  NULL,
    [Updated]            DATETIME2 (0)  NULL,
    [Hash]               VARBINARY (32) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_SignalPriority_ExpectedActivationAgg_Merge]
    ON [fact].[RT_SignalPriority_ExpectedActivationAgg]([JourneyPatternKey] ASC, [ActivationPointKey] ASC, [DateKey] ASC);


GO

