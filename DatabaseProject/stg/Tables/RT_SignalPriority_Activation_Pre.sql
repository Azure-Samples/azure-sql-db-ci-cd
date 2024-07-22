CREATE TABLE [stg].[RT_SignalPriority_Activation_Pre] (
    [RowId]          INT             IDENTITY (1, 1) NOT NULL,
    [LogTimeLocal]   DATETIME2 (7)   NULL,
    [DirectionText]  VARCHAR (3)     NULL,
    [Username]       VARCHAR (20)    NULL,
    [SourceEndpoint] VARCHAR (100)   NULL,
    [SignalData]     NVARCHAR (1000) NULL
);


GO

