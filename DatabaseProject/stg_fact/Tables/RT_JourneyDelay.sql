CREATE TABLE [stg_fact].[RT_JourneyDelay] (
    [DateKey]                             INT           NULL,
    [DeviationStandardReasonKey]          INT           NULL,
    [DeviationCustomReasonKey]            INT           NULL,
    [SourceSystemKey]                     INT           NULL,
    [LineKey]                             INT           NULL,
    [JourneyPatternKey]                   INT           NULL,
    [ContractKey]                         INT           NULL,
    [ContractorKey]                       INT           NULL,
    [JourneyRef]                          NVARCHAR (18) NULL,
    [LineNumber]                          NVARCHAR (50) NULL,
    [ContractCode]                        NVARCHAR (20) NULL,
    [ContractorCode]                      NVARCHAR (20) NULL,
    [JourneyPatternId]                    NUMERIC (16)  NULL,
    [SourceSystemCode]                    NVARCHAR (20) NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50) NULL,
    [SourceSystemEntryRef]                BIGINT        NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20) NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (20) NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (50) NULL,
    [CreatedUtcDateTime]                  DATETIME      NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3) NULL,
    [DeviationDelayMinutes]               INT           NULL,
    [ObservedDelayMinutes]                INT           NULL,
    [DelayCaseNumber]                     INT           NOT NULL,
    [OriginStopPointId]                   INT           NULL,
    [PlannedStartDateTime]                DATETIME2 (0) NULL,
    [TargetDepartureDateTimeFinal]        DATETIME2 (0) NULL,
    [ObservedDepartureDateTime]           DATETIME2 (0) NULL,
    [ObservedDelay]                       BIT           NULL,
    [DeviationDelay]                      BIT           NULL,
    [CorrectDelay]                        BIT           NULL
);


GO

