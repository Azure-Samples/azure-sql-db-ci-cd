CREATE TABLE [stg].[RT_SignalPriority_Activation] (
    [SourceSystemCode]     VARCHAR (20)       NOT NULL,
    [SourceSystemEntryRef] VARCHAR (20)       NOT NULL,
    [LogTime]              DATETIMEOFFSET (4) NOT NULL,
    [DataFlowDirection]    TINYINT            NULL,
    [Username]             VARCHAR (20)       NULL,
    [ActivationTime]       DATETIMEOFFSET (3) NOT NULL,
    [LightId]              INT                NOT NULL,
    [RelayNumber]          INT                NOT NULL,
    [Type]                 TINYINT            NOT NULL,
    [LineDesignation]      VARCHAR (8)        NULL,
    [JourneyNumber]        INT                NULL,
    [VehicleNumber]        INT                NULL,
    [DelayMinutes]         INT                NULL,
    [Distance]             REAL               NULL,
    [Speed]                REAL               NULL,
    [ExpectedTime]         DATETIMEOFFSET (3) NULL
);


GO

