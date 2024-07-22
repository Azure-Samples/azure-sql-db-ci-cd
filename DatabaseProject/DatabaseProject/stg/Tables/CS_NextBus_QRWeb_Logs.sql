CREATE TABLE [stg].[CS_NextBus_QRWeb_Logs] (
    [SourceSystemCode]     NVARCHAR (20)   NULL,
    [SourceSystemEntryRef] NVARCHAR (50)   NULL,
    [URL]                  NVARCHAR (200)  NULL,
    [StopNr]               INT             NULL,
    [WeekNr]               INT             NULL,
    [TimeGeneratedUTC]     DATETIME        NULL,
    [TimestampUTC]         DATETIME        NULL,
    [TimestampMS]          INT             NULL,
    [Success]              NVARCHAR (5)    NULL,
    [ResultCode]           INT             NULL,
    [DurationMs]           DECIMAL (18, 2) NULL
);


GO

