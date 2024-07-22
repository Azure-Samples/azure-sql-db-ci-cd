CREATE TABLE [data].[RT_LineStrategicNet] (
    [LineStrategicNetKey] INT            IDENTITY (1, 1) NOT NULL,
    [LineNumber]          INT            NULL,
    [StrategicNetCode]    NVARCHAR (255) NULL,
    [ValidFromDate]       DATE           NULL,
    [ValidToDate]         DATE           NULL,
    [IsCurrent]           BIT            NULL,
    CONSTRAINT [PK_RT_LineStrategicNet] PRIMARY KEY CLUSTERED ([LineStrategicNetKey] ASC)
);


GO

