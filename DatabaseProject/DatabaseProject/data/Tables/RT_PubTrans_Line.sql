CREATE TABLE [data].[RT_PubTrans_Line] (
    [SourceSystemCode]         NVARCHAR (20) NOT NULL,
    [SourceSystemEntityRef]    NVARCHAR (20) NOT NULL,
    [LineSid]                  BIGINT        NOT NULL,
    [LinePid]                  BIGINT        NOT NULL,
    [LineGid]                  BIGINT        NOT NULL,
    [LineNumber]               BIGINT        NOT NULL,
    [LineDesignation]          NVARCHAR (8)  NULL,
    [LineName]                 NVARCHAR (50) NULL,
    [LineIsMonitored]          BIT           NULL,
    [DefaultTransportModeCode] NVARCHAR (8)  NULL,
    [ValidFromDate]            DATE          NOT NULL,
    [ValidToDate]              DATE          NULL,
    CONSTRAINT [PK_RT_PubTrans_Line_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntityRef] ASC)
);


GO

