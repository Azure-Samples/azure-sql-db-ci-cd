CREATE TABLE [fact].[RT_SignalPriority_ITS_Activation] (
    [DateKey]                      INT            NOT NULL,
    [ActivationStartTimeKey]       INT            NOT NULL,
    [ActivationEndTimeKey]         INT            NOT NULL,
    [LineKey]                      INT            NOT NULL,
    [LineDirectionKey]             INT            NOT NULL,
    [VehicleKey]                   INT            NOT NULL,
    [ActivationPointKey]           INT            NOT NULL,
    [SignalKey]                    INT            NOT NULL,
    [ActivatedActivationTypeKey]   INT            NOT NULL,
    [DeactivatedActivationTypeKey] INT            NOT NULL,
    [MunicipalityKey]              INT            NOT NULL,
    [JourneyRef]                   CHAR (18)      NOT NULL,
    [LightProgramKey]              CHAR (12)      NOT NULL,
    [PrioritizedKey]               INT            NOT NULL,
    [SignalLightColourKey]         INT            NOT NULL,
    [ForcedDeactivatedKey]         INT            NOT NULL,
    [FirstActivatedDateKey]        INT            NOT NULL,
    [FirstActivatedTimeKey]        INT            NOT NULL,
    [IsReactivated]                BIT            NULL,
    [IsFinal]                      BIT            NULL,
    [NumberOfRows]                 INT            NULL,
    [SourceSystemCode]             VARCHAR (20)   NOT NULL,
    [Inserted]                     DATETIME2 (0)  NOT NULL,
    [Updated]                      DATETIME2 (0)  NOT NULL,
    [Hash]                         VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_RT_SignalPriority_ITS_Activation] PRIMARY KEY CLUSTERED ([DateKey] ASC, [ActivationStartTimeKey] ASC, [ActivationEndTimeKey] ASC, [LineKey] ASC, [LineDirectionKey] ASC, [VehicleKey] ASC, [ActivationPointKey] ASC, [SignalKey] ASC, [ActivatedActivationTypeKey] ASC, [DeactivatedActivationTypeKey] ASC, [MunicipalityKey] ASC, [JourneyRef] ASC)
);


GO

