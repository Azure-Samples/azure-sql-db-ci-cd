CREATE TABLE [stg].[QA_ServiceQuality_ContractMeasuringPeriodBridge] (
    [SourceSystemCode]     NVARCHAR (20) NULL,
    [SourceSystemEntryRef] NVARCHAR (30) NULL,
    [ContractCode]         NVARCHAR (20) NULL,
    [MeasuringPeriodRef]   BIGINT        NULL,
    [RequiredInterviews]   INT           NULL
);


GO

