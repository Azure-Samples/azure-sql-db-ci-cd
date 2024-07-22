CREATE TABLE [stg].[RT_PubTrans_Line] (
    [LineSid]                  BIGINT        NULL,
    [LinePid]                  BIGINT        NULL,
    [LineGid]                  BIGINT        NULL,
    [LineNumber]               BIGINT        NULL,
    [LineDesignation]          NVARCHAR (8)  NULL,
    [LineName]                 NVARCHAR (50) NULL,
    [LineIsMonitored]          BIT           NULL,
    [DefaultTransportModeCode] NVARCHAR (8)  NULL,
    [ValidFromDate]            DATE          NULL,
    [ValidToDate]              DATE          NULL,
    [SourceSystemCode]         NVARCHAR (20) NULL,
    [SourceSystemEntityRef]    NVARCHAR (20) NULL
);


GO

