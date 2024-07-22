CREATE TABLE [dim].[QA_ServiceQualitySurvey_MeasuringPeriod] (
    [MeasuringPeriodKey]     INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]       INT            NOT NULL,
    [ValidToDateKey]         INT            NOT NULL,
    [IsCurrent]              BIT            NOT NULL,
    [SourceSystemCode]       NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]    BIGINT         NOT NULL,
    [MeasuringPeriod]        NVARCHAR (255) NOT NULL,
    [ValidFromDate]          DATE           NOT NULL,
    [ValidToDate]            DATE           NOT NULL,
    [NonNytBynetPeriodStart] DATE           NULL,
    [NonNytBynetPeriodEnd]   DATE           NULL,
    [NytBynetWeight]         INT            NULL,
    CONSTRAINT [MeasuringPeriodKey] PRIMARY KEY CLUSTERED ([MeasuringPeriodKey] ASC, [MeasuringPeriod] ASC)
);


GO

