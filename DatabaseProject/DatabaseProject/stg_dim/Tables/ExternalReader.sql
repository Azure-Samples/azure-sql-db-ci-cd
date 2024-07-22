CREATE TABLE [stg_dim].[ExternalReader] (
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (270) NULL,
    [ExternalReaderCode]   NVARCHAR (20)  NULL,
    [ExternalReaderName]   NVARCHAR (250) NULL,
    [ValidFromDate]        DATE           NULL,
    [ValidToDate]          DATE           NULL
);


GO

