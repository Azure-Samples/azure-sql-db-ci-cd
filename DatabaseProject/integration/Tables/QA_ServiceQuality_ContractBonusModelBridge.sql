CREATE TABLE [integration].[QA_ServiceQuality_ContractBonusModelBridge] (
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (30)  NOT NULL,
    [ContractCode]         NVARCHAR (20)  NULL,
    [BonusModelRef]        INT            NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (32) NULL,
    [ModifiedAt]           DATETIME2 (0)  NULL,
    CONSTRAINT [PK_QA_ServiceQuality_ContractBonusModelBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

