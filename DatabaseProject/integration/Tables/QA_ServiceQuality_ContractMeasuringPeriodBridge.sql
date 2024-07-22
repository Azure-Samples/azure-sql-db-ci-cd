CREATE TABLE [integration].[QA_ServiceQuality_ContractMeasuringPeriodBridge] (
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (30)  NOT NULL,
    [ContractCode]         NVARCHAR (20)  NOT NULL,
    [MeasuringPeriodRef]   BIGINT         NOT NULL,
    [RequiredInterviews]   INT            NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_ContractMeasuringPeriodBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

