CREATE TABLE [integration].[QA_ServiceQuality_ContractOfferedServiceLevel] (
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] BIGINT         NOT NULL,
    [ContractCode]         NVARCHAR (20)  NULL,
    [OfferedServiceLevel]  DECIMAL (5, 2) NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (50) NULL,
    [ModifiedAt]           DATETIME2 (0)  NULL,
    CONSTRAINT [PK_QA_ServiceQuality_ContractOfferedServiceLevel_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

