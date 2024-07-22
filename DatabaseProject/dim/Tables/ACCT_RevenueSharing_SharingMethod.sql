CREATE TABLE [dim].[ACCT_RevenueSharing_SharingMethod] (
    [SharingMethodKey]          INT            NOT NULL,
    [ValidFromDateKey]          INT            NOT NULL,
    [ValidToDateKey]            INT            NOT NULL,
    [IsCurrent]                 INT            NOT NULL,
    [SourceSystemCode]          NVARCHAR (20)  NULL,
    [SourceSystemEntryId]       NVARCHAR (20)  NULL,
    [SharingMethodCode]         NVARCHAR (20)  NULL,
    [SharingMethodName]         NVARCHAR (100) NULL,
    [SharingMethodDisplayIndex] INT            NOT NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_SharingMethod] PRIMARY KEY CLUSTERED ([SharingMethodKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_ACCT_RevenueSharing_SharingMethod]
    ON [dim].[ACCT_RevenueSharing_SharingMethod]([SharingMethodCode] ASC, [ValidFromDateKey] ASC);


GO

