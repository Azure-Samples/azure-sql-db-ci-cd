CREATE TABLE [stg].[CS_NextBus_SMS1250_Logs] (
    [FileNameFtp]          NVARCHAR (26)   NULL,
    [SourceSystemCode]     NVARCHAR (20)   NULL,
    [SourceSystemEntryRef] NVARCHAR (2000) NULL,
    [Log]                  NVARCHAR (4000) NULL,
    [TimeGenerated]        DATETIME        NULL,
    [StopNr]               INT             NULL,
    [StopName]             NVARCHAR (2000) NULL,
    [ExactStopNrMatch]     BIT             NULL,
    [IsCountable]          BIT             NULL
);


GO

