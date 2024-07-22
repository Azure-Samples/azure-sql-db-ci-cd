CREATE TABLE [dim].[ExternalReader] (
    [ExternalReaderKey]    INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]     INT            NOT NULL,
    [ValidToDateKey]       INT            NOT NULL,
    [IsCurrent]            BIT            NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (270) NOT NULL,
    [ExternalReaderCode]   NVARCHAR (20)  NULL,
    [ExternalReaderName]   NVARCHAR (250) NOT NULL,
    [ValidFromDate]        DATE           NULL,
    [ValidToDate]          DATE           NULL,
    CONSTRAINT [PK_ExternalReader] PRIMARY KEY CLUSTERED ([ExternalReaderKey] ASC)
);


GO

