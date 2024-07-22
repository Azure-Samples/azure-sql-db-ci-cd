CREATE TABLE [stg].[RT_Signal] (
    [SignalId]             INT               IDENTITY (1, 1) NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (40)     NULL,
    [SourceSystemCode]     NVARCHAR (20)     NULL,
    [Name]                 VARCHAR (20)      NULL,
    [Location]             VARCHAR (100)     NULL,
    [Municipality]         VARCHAR (20)      NULL,
    [Longitude]            DECIMAL (18, 11)  NULL,
    [Latitude]             DECIMAL (18, 11)  NULL,
    [Center]               [sys].[geography] NULL,
    [Hash]                 VARBINARY (32)    NULL,
    CONSTRAINT [PK_RT_Signal_SignalId] PRIMARY KEY CLUSTERED ([SignalId] ASC)
);


GO

