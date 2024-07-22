CREATE TABLE [integration].[QA_ServiceQuality_ContractPricePerHour] (
    [SourceSystemCode]     NVARCHAR (20)    NOT NULL,
    [SourceSystemEntryRef] BIGINT           NOT NULL,
    [ContractCode]         NVARCHAR (20)    NULL,
    [PricePeriodName]      NVARCHAR (255)   NULL,
    [PricePeriodStartDate] DATE             NULL,
    [PricePeriodEndDate]   DATE             NULL,
    [PricePerHour]         NUMERIC (18, 10) NULL,
    [Inserted]             DATETIME2 (0)    NOT NULL,
    [Updated]              DATETIME2 (0)    NOT NULL,
    [Hash]                 VARBINARY (32)   NOT NULL,
    [ModifiedAt]           DATETIME2 (0)    NULL,
    CONSTRAINT [PK_QA_ServiceQuality_ContractPricePerHour] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

