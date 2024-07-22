CREATE TABLE [stg_dim].[Contractor] (
    [SourceSystemCode]         NVARCHAR (20)  NULL,
    [SourceSystemEntryId]      BIGINT         NULL,
    [ContractorCode]           NVARCHAR (20)  NULL,
    [ContractorName]           NVARCHAR (250) NULL,
    [ContractorNumber]         INT            NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL,
    [ContractorKey]            INT            NULL,
    [IsCurrent]                BIT            NULL,
    [ValidFromDateKey]         INT            NULL,
    [ValidToDateKey]           INT            NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [TransportAuthorityNumber] INT            NULL
);


GO

