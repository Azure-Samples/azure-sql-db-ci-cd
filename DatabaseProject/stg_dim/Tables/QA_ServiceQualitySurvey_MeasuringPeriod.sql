CREATE TABLE [stg_dim].[QA_ServiceQualitySurvey_MeasuringPeriod] (
    [MeasuringPeriodKey]     INT            NULL,
    [ValidFromDateKey]       INT            NULL,
    [ValidToDateKey]         INT            NULL,
    [IsCurrent]              BIT            NULL,
    [SourceSystemCode]       NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]    BIGINT         NULL,
    [MeasuringPeriod]        NVARCHAR (255) NULL,
    [ValidFromDate]          DATE           NULL,
    [ValidToDate]            DATE           NULL,
    [NonNytBynetPeriodStart] DATE           NULL,
    [NonNytBynetPeriodEnd]   DATE           NULL,
    [NytBynetWeight]         INT            NULL
);


GO

