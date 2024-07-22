CREATE TABLE [dim].[ACCT_RevenueSharing_RevenueType] (
    [RevenueTypeKey]          INT            NOT NULL,
    [ValidFromDateKey]        INT            NOT NULL,
    [ValidToDateKey]          INT            NOT NULL,
    [IsCurrent]               INT            NOT NULL,
    [SourceSystemCode]        NVARCHAR (20)  NULL,
    [SourceSystemEntryId]     NVARCHAR (20)  NULL,
    [RevenueTypeCode]         NVARCHAR (20)  NULL,
    [RevenueTypeName]         NVARCHAR (100) NULL,
    [RevenueTypeDisplayIndex] INT            NOT NULL
);


GO

