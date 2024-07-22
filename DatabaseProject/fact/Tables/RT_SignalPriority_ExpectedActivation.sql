CREATE TABLE [fact].[RT_SignalPriority_ExpectedActivation] (
    [JourneyPatternKey]       INT           NOT NULL,
    [ActivationPointKey]      INT           NOT NULL,
    [DateKey]                 INT           NULL,
    [TimeKey]                 INT           NULL,
    [LightId]                 INT           NOT NULL,
    [JourneyRef]              CHAR (18)     NOT NULL,
    [LinkRef]                 NVARCHAR (20) NOT NULL,
    [PlannedLinkEnterTime]    DATETIME2 (0) NULL,
    [ObservedLinkEnterTime]   DATETIME2 (0) NULL,
    [ObservedLinkExitTime]    DATETIME2 (0) NULL,
    [IsObserved]              INT           NULL,
    [LinkFromJourneyPointRef] CHAR (22)     NULL,
    [LinkToJourneyPointRef]   CHAR (22)     NULL
);


GO

