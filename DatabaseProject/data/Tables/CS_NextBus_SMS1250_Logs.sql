CREATE TABLE [data].[CS_NextBus_SMS1250_Logs] (
    [SourceSystemCode]     NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (2000) NOT NULL,
    [FileNameFtp]          NVARCHAR (26)   NOT NULL,
    [TimeGenerated]        DATETIME        NULL,
    [Log]                  NVARCHAR (4000) NULL,
    [StopNr]               INT             NULL,
    [StopName]             NVARCHAR (2000) NULL,
    [ExactStopNrMatch]     BIT             NULL,
    [IsCountable]          BIT             NULL,
    [Inserted]             DATETIME2 (0)   NULL,
    [Updated]              DATETIME2 (0)   NULL,
    [Hash]                 VARBINARY (32)  NULL,
    CONSTRAINT [PK_CS_NextBus_SMS1250_Logs] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

