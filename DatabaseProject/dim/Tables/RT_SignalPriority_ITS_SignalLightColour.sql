CREATE TABLE [dim].[RT_SignalPriority_ITS_SignalLightColour] (
    [SignalLightColourKey] INT          NOT NULL,
    [SignalLightColour]    VARCHAR (18) NULL,
    CONSTRAINT [PK_SignalLightColourKey] PRIMARY KEY CLUSTERED ([SignalLightColourKey] ASC)
);


GO

