CREATE TABLE [dim].[ProductGroup] (
    [ProductGroupKey]          INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]         INT            NOT NULL,
    [ValidToDateKey]           INT            NOT NULL,
    [IsCurrent]                BIT            NOT NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [ProductGroupCode]         NVARCHAR (20)  NULL,
    [ProductGroupName]         NVARCHAR (250) NOT NULL,
    [ProductGroupDisplayIndex] INT            NOT NULL,
    [ProductGroupDisplayName]  NVARCHAR (250) NOT NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NULL,
    CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED ([ProductGroupKey] ASC)
);


GO

