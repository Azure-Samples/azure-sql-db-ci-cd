CREATE TABLE [stg_dim].[QA_ServiceQuality_MeasuringPeriod] (
    [SourceSystemCode]         NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]     BIGINT         NULL,
    [MeasuringPeriodRef]       INT            NULL,
    [MeasuringPeriodName]      NVARCHAR (255) NULL,
    [MeasuringPeriodStartDate] DATE           NULL,
    [MeasuringPeriodEndDate]   DATE           NULL
);


GO

