CREATE TABLE [stg].[QA_ServiceQuality_ServiceLevel] (
    [SourceSystemCode]         NVARCHAR (30)    NULL,
    [SourceSystemEntryRef]     NVARCHAR (100)   NULL,
    [JourneyRef]               NVARCHAR (18)    NULL,
    [IsFuture]                 BIT              NULL,
    [PaidDurationSeconds]      NUMERIC (19, 10) NULL,
    [CancelledDurationSeconds] NUMERIC (19, 10) NULL,
    [OperatingDayDate]         DATE             NULL,
    [OperatingDayType]         INT              NULL,
    [ContractorCode]           NVARCHAR (20)    NULL,
    [ContractCode]             NVARCHAR (20)    NULL,
    [GarageCode]               NVARCHAR (20)    NULL,
    [LineNumber]               INT              NULL
);


GO

