CREATE TABLE [integration].[ContractorBridge] (
    [ContractorMappingId] INT           IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]    NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId] BIGINT        NOT NULL,
    [ContractorCode]      NVARCHAR (20) NOT NULL,
    [ValidFromDate]       DATE          NULL,
    [ValidToDate]         DATE          NULL
);


GO

