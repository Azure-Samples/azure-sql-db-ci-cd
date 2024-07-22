CREATE TABLE [dim].[QA_ServiceQualitySurvey_ContractPricePerHour] (
    [ContractPricePerHourKey] INT              IDENTITY (1, 1) NOT NULL,
    [PricePerHourPeriod]      NVARCHAR (255)   NOT NULL,
    [ValidFromDateKey]        INT              NOT NULL,
    [ValidToDateKey]          INT              NOT NULL,
    [IsCurrent]               BIT              NOT NULL,
    [ContractCode]            NVARCHAR (20)    NOT NULL,
    [SourceSystemCode]        NVARCHAR (20)    NOT NULL,
    [SourceSystemEntryId]     BIGINT           NOT NULL,
    [PricePerHour]            NUMERIC (18, 10) NOT NULL,
    [ValidFromDate]           DATE             NOT NULL,
    [ValidToDate]             DATE             NOT NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_ContractPricePerHour] PRIMARY KEY CLUSTERED ([ContractPricePerHourKey] ASC, [ContractCode] ASC, [SourceSystemEntryId] ASC)
);


GO

