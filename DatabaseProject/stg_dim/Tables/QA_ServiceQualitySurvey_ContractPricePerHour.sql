CREATE TABLE [stg_dim].[QA_ServiceQualitySurvey_ContractPricePerHour] (
    [ContractPricePerHourKey] INT              NULL,
    [PricePerHourPeriod]      NVARCHAR (255)   NULL,
    [ValidFromDateKey]        INT              NULL,
    [ValidToDateKey]          INT              NULL,
    [IsCurrent]               BIT              NULL,
    [ContractCode]            NVARCHAR (20)    NULL,
    [SourceSystemCode]        NVARCHAR (20)    NOT NULL,
    [SourceSystemEntryId]     BIGINT           NULL,
    [PricePerHour]            NUMERIC (18, 10) NULL,
    [ValidFromDate]           DATE             NULL,
    [ValidToDate]             DATE             NULL
);


GO

