CREATE TABLE [dim].[Contractor] (
    [ContractorKey]            INT            IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [ValidFromDateKey]         INT            NOT NULL,
    [ValidToDateKey]           INT            NOT NULL,
    [IsCurrent]                BIT            NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NULL,
    [ContractorCode]           NVARCHAR (20)  NULL,
    [ContractorName]           NVARCHAR (250) NOT NULL,
    [ContractorNumber]         INT            NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [TransportAuthorityNumber] INT            NULL,
    CONSTRAINT [PK_Contractor] PRIMARY KEY CLUSTERED ([ContractorKey] ASC),
    CONSTRAINT [BK_Contractor] UNIQUE NONCLUSTERED ([SourceSystemCode] ASC, [ContractorCode] ASC, [ValidFromDateKey] ASC),
    CONSTRAINT [UQ_Contractor_SourceSystemCode_SourceSystemEntryId] UNIQUE NONCLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_Contractor_ContractorCode_ValidFromDateKey_ValidToDateKey_ContractorKey]
    ON [dim].[Contractor]([ContractorCode] ASC, [ValidFromDateKey] ASC, [ValidToDateKey] ASC, [ContractorKey] ASC);


GO

