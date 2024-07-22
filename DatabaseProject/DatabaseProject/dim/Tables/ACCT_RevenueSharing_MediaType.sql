CREATE TABLE [dim].[ACCT_RevenueSharing_MediaType] (
    [MediaTypeKey]          INT            NOT NULL,
    [ValidFromDateKey]      INT            NOT NULL,
    [ValidToDateKey]        INT            NOT NULL,
    [IsCurrent]             INT            NOT NULL,
    [SourceSystemCode]      NVARCHAR (20)  NULL,
    [SourceSystemEntryId]   NVARCHAR (20)  NULL,
    [MediaTypeCode]         NVARCHAR (20)  NULL,
    [MediaTypeName]         NVARCHAR (100) NULL,
    [MediaTypeDisplayIndex] INT            NOT NULL
);


GO

