CREATE TABLE [data].[QA_ServiceQuality_ServiceLevel-AHN] (
    [SourceSystemCode]         NVARCHAR (30)    NOT NULL,
    [SourceSystemEntryRef]     NVARCHAR (100)   NOT NULL,
    [IsFuture]                 BIT              NOT NULL,
    [JourneyRef]               NVARCHAR (18)    NULL,
    [PaidDurationSeconds]      NUMERIC (19, 10) NULL,
    [CancelledDurationSeconds] NUMERIC (19, 10) NULL,
    [OperatingDayDate]         DATE             NULL,
    [OperatingDayType]         INT              NULL,
    [ContractorCode]           NVARCHAR (20)    NULL,
    [ContractCode]             NVARCHAR (20)    NULL,
    [GarageCode]               NVARCHAR (20)    NULL,
    [LineNumber]               INT              NULL,
    [Inserted]                 DATETIME2 (0)    NOT NULL,
    [Updated]                  DATETIME2 (0)    NOT NULL,
    [Hash]                     VARBINARY (32)   NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_ServiceLevel-AHN] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_QA_ServiceQuality_ServiceLevel_DELETE]
    ON [data].[QA_ServiceQuality_ServiceLevel-AHN]([OperatingDayDate] ASC)
    INCLUDE([IsFuture]);


GO

