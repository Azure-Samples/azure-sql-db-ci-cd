CREATE TABLE [dim].[RT_StrategicNet] (
    [StrategicNetKey]          INT            IDENTITY (1, 1) NOT NULL,
    [StrategicNetCode]         NVARCHAR (255) NULL,
    [StrategicNetName]         NVARCHAR (255) NULL,
    [StrategicNetDisplayIndex] INT            NULL,
    [StrategicNetDisplayName]  NVARCHAR (250) NULL,
    CONSTRAINT [PK_RT_StrategicNet] PRIMARY KEY CLUSTERED ([StrategicNetKey] ASC)
);


GO

