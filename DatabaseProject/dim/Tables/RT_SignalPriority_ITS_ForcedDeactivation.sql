CREATE TABLE [dim].[RT_SignalPriority_ITS_ForcedDeactivation] (
    [ForcedDeactivationKey] INT           IDENTITY (1, 1) NOT NULL,
    [ActivationDatetime]    DATETIME2 (0) NOT NULL,
    [ActivationPoint]       INT           NULL,
    [Linenumber]            INT           NULL,
    [SourceSystemCode]      VARCHAR (20)  NULL,
    [Inserted]              DATETIME2 (0) NULL,
    [Updated]               DATETIME2 (0) NULL,
    CONSTRAINT [PK_RT_SignalPriority_ITS_ForcedDeactivation] PRIMARY KEY CLUSTERED ([ForcedDeactivationKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_SignalPriority_ITS_ForcedDeactivation_Merge]
    ON [dim].[RT_SignalPriority_ITS_ForcedDeactivation]([ActivationDatetime] ASC, [ActivationPoint] ASC, [Linenumber] ASC, [SourceSystemCode] ASC);


GO

