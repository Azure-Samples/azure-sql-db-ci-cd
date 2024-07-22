CREATE TABLE [stg].[RT_ContractorGarageBridge] (
    [SourceSystemCode]     NVARCHAR (20) NULL,
    [SourceSystemEntryId]  BIGINT        NULL,
    [LineNumber]           INT           NULL,
    [ContractCode]         NVARCHAR (20) NULL,
    [ContractorGarageCode] NVARCHAR (20) NULL,
    [ValidFromDate]        DATE          NULL,
    [ValidToDate]          DATE          NULL
);


GO

