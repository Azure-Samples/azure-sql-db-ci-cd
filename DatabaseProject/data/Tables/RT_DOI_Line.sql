CREATE TABLE [data].[RT_DOI_Line] (
    [LineId]                   DECIMAL (16)  NOT NULL,
    [LineName]                 NVARCHAR (50) NULL,
    [LineDesignation]          NVARCHAR (8)  NULL,
    [DefaultTransportModeCode] VARCHAR (8)   NULL,
    [LineGid]                  DECIMAL (16)  NULL,
    [LineIsMonitored]          BIT           NULL,
    [LastModifiedUtcDateTime]  DATETIME2 (3) NULL,
    [ValidFromDate]            DATE          NULL,
    [InsertedUtc]              DATETIME2 (0) NOT NULL,
    [UpdatedUtc]               DATETIME2 (0) NOT NULL,
    [Hash]                     BINARY (32)   NOT NULL,
    [LineNumber]               DECIMAL (4)   NULL,
    [TransportAuthorityCode]   NVARCHAR (20) NULL,
    [ValidToDate]              DATE          NULL,
    CONSTRAINT [PK_RT_DOI_Line_1] PRIMARY KEY CLUSTERED ([LineId] ASC)
);


GO

