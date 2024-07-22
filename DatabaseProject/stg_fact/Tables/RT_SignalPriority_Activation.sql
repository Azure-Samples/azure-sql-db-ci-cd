CREATE TABLE [stg_fact].[RT_SignalPriority_Activation] (
    [ActivationKey]           INT                NOT NULL,
    [JourneyPatternKey]       INT                NULL,
    [ActivationPointKey]      INT                NULL,
    [DateKey]                 INT                NULL,
    [TimeKey]                 INT                NULL,
    [SourceSystemCode]        VARCHAR (20)       NOT NULL,
    [SourceSystemEntryRef]    VARCHAR (20)       NULL,
    [JourneyRef]              CHAR (18)          NULL,
    [LinkFromJourneyPointRef] VARCHAR (22)       NULL,
    [LinkToJourneyPointRef]   VARCHAR (22)       NULL,
    [LinkRef]                 NVARCHAR (20)      NULL,
    [Type]                    TINYINT            NULL,
    [LineDesignation]         VARCHAR (8)        NULL,
    [JourneyNumber]           INT                NULL,
    [LightId]                 INT                NULL,
    [RelayNumber]             INT                NULL,
    [ActivationTime]          DATETIMEOFFSET (3) NULL,
    [JourneyPatternId]        BIGINT             NULL
);


GO

