CREATE TABLE [dim].[ACCT_RevenueSharing_SalesChannel] (
    [SalesChannelKey]          INT            NOT NULL,
    [ValidFromDateKey]         INT            NOT NULL,
    [ValidToDateKey]           INT            NOT NULL,
    [IsCurrent]                INT            NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NULL,
    [SourceSystemEntryId]      NVARCHAR (20)  NULL,
    [SalesChannelCode]         NVARCHAR (20)  NULL,
    [SalesChannelName]         NVARCHAR (100) NULL,
    [SalesChannelDisplayIndex] INT            NOT NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_SalesChannel] PRIMARY KEY CLUSTERED ([SalesChannelKey] ASC)
);


GO

