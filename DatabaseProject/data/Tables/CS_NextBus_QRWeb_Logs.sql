CREATE TABLE [data].[CS_NextBus_QRWeb_Logs] (
    [SourceSystemCode]     NVARCHAR (20)   NULL,
    [SourceSystemEntryRef] NVARCHAR (50)   NOT NULL,
    [URL]                  NVARCHAR (200)  NULL,
    [StopNr]               INT             NULL,
    [WeekNr]               INT             NULL,
    [TimeGeneratedUTC]     DATETIME        NULL,
    [TimestampUTC]         DATETIME        NULL,
    [TimestampMS]          INT             NULL,
    [Success]              NVARCHAR (5)    NULL,
    [ResultCode]           INT             NULL,
    [DurationMs]           DECIMAL (18, 2) NULL,
    [Inserted]             DATETIME2 (0)   NULL,
    [Updated]              DATETIME2 (0)   NULL,
    [Hash]                 VARBINARY (32)  NULL,
    CONSTRAINT [PK_CS_NextBus_QRWeb_Logs] PRIMARY KEY CLUSTERED ([SourceSystemEntryRef] ASC)
);


GO

