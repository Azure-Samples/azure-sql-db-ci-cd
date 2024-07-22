CREATE TABLE [integration].[QA_ServiceQuality_LineBridge] (
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] NVARCHAR (250) NOT NULL,
    [LineNumber]          INT            NULL,
    [LineDesignation]     NVARCHAR (20)  NULL,
    [ValidFromDate]       DATE           NULL,
    [ValidToDate]         DATE           NULL,
    [Inserted]            DATETIME2 (0)  NULL,
    [Updated]             DATETIME2 (0)  NULL,
    [Hash]                VARBINARY (32) NULL,
    CONSTRAINT [PK_QA_ServiceQuality_LineBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

