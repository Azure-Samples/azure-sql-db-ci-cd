CREATE TABLE [dim].[Contract] (
    [ContractKey]              INT            IDENTITY (1, 1) NOT NULL,
    [ContractorKey]            INT            NOT NULL,
    [ValidFromDateKey]         INT            NOT NULL,
    [ValidToDateKey]           INT            NOT NULL,
    [IsCurrent]                BIT            NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NULL,
    [ContractCode]             NVARCHAR (20)  NOT NULL,
    [ContractName]             NVARCHAR (250) NOT NULL,
    [ContractDisplayName]      NVARCHAR (250) NOT NULL,
    [TenderCode]               NVARCHAR (20)  NULL,
    [TenderName]               NVARCHAR (250) NULL,
    [ValidFromDate]            DATE           NOT NULL,
    [ValidToDate]              DATE           NULL,
    [IsExtraJourney]           TINYINT        NULL,
    [IsTrainBus]               TINYINT        NULL,
    [TransportAuthorityCode]   NVARCHAR (20)  NULL,
    [TransportAuthorityName]   NVARCHAR (250) NULL,
    [TransportAuthorityNumber] INT            NULL,
    [ContractorCode]           NVARCHAR (20)  NULL,
    CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED ([ContractKey] ASC),
    CONSTRAINT [FK_Contract_Contractor] FOREIGN KEY ([ContractorKey]) REFERENCES [dim].[Contractor] ([ContractorKey]),
    CONSTRAINT [BK_Contract] UNIQUE NONCLUSTERED ([ContractCode] ASC, [ValidFromDate] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_Contract_ContractCode_ValidFromDateKey_ValidToDateKey_ContractKey_ContractName]
    ON [dim].[Contract]([ContractCode] ASC, [ValidFromDateKey] ASC, [ValidToDateKey] ASC, [ContractKey] ASC, [ContractName] ASC);


GO

CREATE NONCLUSTERED INDEX [IX_Contract_ContractCode]
    ON [dim].[Contract]([ContractCode] ASC)
    INCLUDE([ValidFromDateKey], [ValidToDateKey], [IsCurrent], [ContractName], [ContractDisplayName], [TenderCode], [TenderName], [ValidFromDate], [ValidToDate]);


GO

