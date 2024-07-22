CREATE TABLE [stg_fact].[QA_ServiceQuality_ServiceLevel] (
    [IsFuture]                 BIT            NULL,
    [DateKey]                  INT            NULL,
    [OperatingDayDate]         DATE           NULL,
    [OperatingDayTypeKey]      INT            NULL,
    [OperatingDayType]         INT            NULL,
    [ContractorKey]            INT            NULL,
    [ContractorCode]           NVARCHAR (20)  NULL,
    [ContractKey]              INT            NULL,
    [ContractCode]             NVARCHAR (20)  NULL,
    [GarageKey]                INT            NULL,
    [GarageCode]               NVARCHAR (20)  NULL,
    [MeasuringPeriodKey]       INT            NULL,
    [LineKey]                  INT            NULL,
    [LineNumber]               INT            NULL,
    [PaidDurationSeconds]      DECIMAL (18)   NULL,
    [CancelledDurationSeconds] DECIMAL (18)   NULL,
    [PricePerHour]             DECIMAL (18)   NULL,
    [OfferedServiceLevel]      DECIMAL (9, 2) NULL
);


GO

