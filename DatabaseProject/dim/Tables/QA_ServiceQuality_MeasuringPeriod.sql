CREATE TABLE [dim].[QA_ServiceQuality_MeasuringPeriod] (
    [MeasuringPeriodKey]       INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]     BIGINT         NOT NULL,
    [MeasuringPeriodRef]       INT            NULL,
    [MeasuringPeriodName]      NVARCHAR (255) NULL,
    [MeasuringPeriodStartDate] DATE           NULL,
    [MeasuringPeriodEndDate]   DATE           NULL,
    [Inserted]                 DATETIME2 (0)  NOT NULL,
    [Updated]                  DATETIME2 (0)  NOT NULL,
    [Hash]                     VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_MeasuringPeriod] PRIMARY KEY CLUSTERED ([MeasuringPeriodKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQuality_MeasuringPeriod_Merge]
    ON [dim].[QA_ServiceQuality_MeasuringPeriod]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([MeasuringPeriodRef], [MeasuringPeriodName], [MeasuringPeriodStartDate], [MeasuringPeriodEndDate]);


GO

