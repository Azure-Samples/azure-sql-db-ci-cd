CREATE TABLE [stg_fact].[QA_ServiceQualitySurvey_ServiceLevel] (
    [JourneyRef]               CHAR (18)        NULL,
    [DateKey]                  INT              NULL,
    [OperatingDayTypeKey]      INT              NULL,
    [ContractorKey]            INT              NULL,
    [ContractKey]              INT              NULL,
    [LineKey]                  INT              NULL,
    [IsFuture]                 BIT              NULL,
    [PaidDurationSeconds]      NUMERIC (19, 10) NULL,
    [CancelledDurationSeconds] NUMERIC (19, 10) NULL,
    [PricePerHour]             NUMERIC (19, 10) NULL,
    [OfferedServiceLevel]      DECIMAL (9, 2)   NULL,
    [OperatingDayDate]         DATE             NULL,
    [OperatingDayType]         INT              NULL,
    [ContractorCode]           NVARCHAR (20)    NULL,
    [ContractCode]             NVARCHAR (20)    NULL,
    [LineNumber]               INT              NULL,
    [LineDisplayName]          NVARCHAR (250)   NULL,
    [ContractName]             NVARCHAR (250)   NULL,
    [MeasuringPeriodKey]       INT              NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_QA_ServiceQualitySurvey_ServiceLevel]
    ON [stg_fact].[QA_ServiceQualitySurvey_ServiceLevel]([JourneyRef] ASC)
    INCLUDE([CancelledDurationSeconds], [ContractKey], [ContractorKey], [DateKey], [IsFuture], [LineKey], [OfferedServiceLevel], [OperatingDayTypeKey], [PaidDurationSeconds], [PricePerHour]);


GO
ALTER INDEX [BK_QA_ServiceQualitySurvey_ServiceLevel]
    ON [stg_fact].[QA_ServiceQualitySurvey_ServiceLevel] DISABLE;


GO

CREATE NONCLUSTERED INDEX [UQ_QA_ServiceQualitySurvey_ServiceLevel_Merge]
    ON [stg_fact].[QA_ServiceQualitySurvey_ServiceLevel]([OperatingDayDate] ASC)
    INCLUDE([JourneyRef], [DateKey], [ContractorKey], [ContractKey], [LineKey], [ContractorCode], [ContractCode], [LineNumber], [MeasuringPeriodKey]);


GO

