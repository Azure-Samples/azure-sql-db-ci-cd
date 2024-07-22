CREATE TABLE [dim].[RT_SignalPriority_ITS_ActivationType] (
    [ActivationTypeKey] INT          NOT NULL,
    [ActivationType]    VARCHAR (22) NULL,
    CONSTRAINT [PK_ActivationTypeKey] PRIMARY KEY CLUSTERED ([ActivationTypeKey] ASC)
);


GO

