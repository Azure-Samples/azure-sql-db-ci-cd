CREATE TABLE [stg].[QA_ServiceQuality_ContractPricePerHour] (
    [SourceSystemCode]     NVARCHAR (20)    NOT NULL,
    [SourceSystemEntryRef] BIGINT           NOT NULL,
    [ContractCode]         NVARCHAR (20)    NULL,
    [PricePeriodName]      NVARCHAR (255)   NULL,
    [PricePeriodStartDate] DATE             NULL,
    [PricePeriodEndDate]   DATE             NULL,
    [PricePerHour]         NUMERIC (18, 10) NULL,
    [ModifiedAt]           DATETIME2 (0)    NULL
);


GO

