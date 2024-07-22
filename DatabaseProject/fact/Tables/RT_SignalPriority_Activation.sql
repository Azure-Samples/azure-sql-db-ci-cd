CREATE TABLE [fact].[RT_SignalPriority_Activation] (
    [ActivationKey]           INT           IDENTITY (1, 1) NOT NULL,
    [JourneyPatternKey]       INT           NOT NULL,
    [ActivationPointKey]      INT           NOT NULL,
    [DateKey]                 INT           NOT NULL,
    [TimeKey]                 INT           NOT NULL,
    [SourceSystemCode]        VARCHAR (20)  NOT NULL,
    [JourneyRef]              CHAR (18)     NULL,
    [LinkRef]                 NVARCHAR (50) NULL,
    [Type]                    TINYINT       NOT NULL,
    [Checksum]                BINARY (20)   NULL,
    [LinkToJourneyPointRef]   CHAR (22)     NULL,
    [LinkFromJourneyPointRef] CHAR (22)     NULL,
    [SourceSystemEntryRef]    CHAR (22)     NULL
);


GO

