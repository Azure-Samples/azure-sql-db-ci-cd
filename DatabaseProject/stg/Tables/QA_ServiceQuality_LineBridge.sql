CREATE TABLE [stg].[QA_ServiceQuality_LineBridge] (
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] NVARCHAR (250) NOT NULL,
    [LineNumber]          INT            NULL,
    [LineDesignation]     NVARCHAR (20)  NULL,
    [ValidFromDate]       DATE           NULL,
    [ValidToDate]         DATE           NULL
);


GO

