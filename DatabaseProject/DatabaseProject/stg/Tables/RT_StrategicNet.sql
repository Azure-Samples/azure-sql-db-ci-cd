CREATE TABLE [stg].[RT_StrategicNet] (
    [LineNumber]       NVARCHAR (255) NOT NULL,
    [LineDesignation]  NVARCHAR (255) NOT NULL,
    [StrategicNetCode] NVARCHAR (255) NULL,
    [StrategicNetName] NVARCHAR (255) NULL,
    CONSTRAINT [pk_StrategicNet] PRIMARY KEY CLUSTERED ([LineNumber] ASC, [LineDesignation] ASC)
);


GO

