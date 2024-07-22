CREATE TABLE [fact].[QA_ServiceQuality_ServiceLevel-AHN] (
    [IsFuture]                 BIT              NOT NULL,
    [DateKey]                  INT              NOT NULL,
    [ContractorKey]            INT              NOT NULL,
    [ContractKey]              INT              NOT NULL,
    [GarageKey]                INT              NULL,
    [LineKey]                  INT              NOT NULL,
    [MeasuringPeriodKey]       INT              NOT NULL,
    [PaidDurationSeconds]      NUMERIC (18, 10) NULL,
    [CancelledDurationSeconds] NUMERIC (18, 10) NULL,
    [PricePerHour]             NUMERIC (18, 10) NULL,
    [OfferedServiceLevel]      DECIMAL (9, 2)   NULL,
    [Inserted]                 DATETIME2 (0)    NOT NULL,
    [Updated]                  DATETIME2 (0)    NOT NULL,
    [Hash]                     VARBINARY (32)   NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQuality_ServiceLevel_Merge]
    ON [fact].[QA_ServiceQuality_ServiceLevel-AHN]([IsFuture] ASC, [DateKey] ASC, [ContractorKey] ASC, [ContractKey] ASC, [LineKey] ASC, [MeasuringPeriodKey] ASC)
    INCLUDE([PaidDurationSeconds], [CancelledDurationSeconds], [PricePerHour], [OfferedServiceLevel]);


GO

