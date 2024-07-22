CREATE TABLE [integration].[RT_StrategicNet] (
    [LineNumber]       NVARCHAR (20)  NOT NULL,
    [LineDesignation]  NVARCHAR (255) NOT NULL,
    [StrategicNetCode] NVARCHAR (20)  NULL,
    [StrategicNetName] NVARCHAR (255) NULL,
    CONSTRAINT [pk_StrategicNet] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [LineDesignation] ASC)
);


GO

