CREATE TABLE [integration].[RT_ContractorGarageBridge] (
    [SourceSystemCode]     NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]  BIGINT        NOT NULL,
    [LineNumber]           INT           NOT NULL,
    [ContractCode]         NVARCHAR (20) NOT NULL,
    [ContractorGarageCode] NVARCHAR (20) NOT NULL,
    [ValidFromDate]        DATE          NOT NULL,
    [ValidToDate]          DATE          NULL,
    CONSTRAINT [PK_RT_ContractorGarageBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RT_ContractorGarageBridge]
    ON [integration].[RT_ContractorGarageBridge]([LineNumber] ASC, [ContractCode] ASC, [ValidFromDate] ASC)
    INCLUDE([ContractorGarageCode], [ValidToDate]);


GO

