CREATE TABLE [stg_dim].[ProductGroup] (
    [ProductGroupKey]          INT            NULL,
    [IsCurrent]                BIT            NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [ProductGroupCode]         NVARCHAR (20)  NULL,
    [ProductGroupName]         NVARCHAR (250) NULL,
    [ProductGroupDisplayIndex] INT            NULL,
    [ProductGroupDisplayName]  NVARCHAR (250) NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NULL
);


GO

