CREATE TABLE [data].[RT_SignalPriority_Activation] (
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
    [ExpectedTime]         DATETIMEOFFSET (3) NULL,
    [Inserted]             DATETIME2 (7)      NULL,
    [Id]                   INT                IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_RT_SignalPriority_Activation_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_RT_SignalPriority_Activation_BMA]
    ON [data].[RT_SignalPriority_Activation]([LogTime] ASC, [LightId] ASC, [RelayNumber] ASC)
    INCLUDE([ActivationTime]);


GO

