CREATE TABLE [fact].[RT_JourneyDelay] (
    [JourneyDelayKey]                     BIGINT        IDENTITY (1, 1) NOT NULL,
    [DateKey]                             INT           NOT NULL,
    [DeviationStandardReasonKey]          INT           NOT NULL,
    [DeviationCustomReasonKey]            INT           NOT NULL,
    [SourceSystemKey]                     INT           NOT NULL,
    [LineKey]                             INT           NULL,
    [JourneyPatternKey]                   INT           NOT NULL,
    [ContractKey]                         INT           NOT NULL,
    [ContractorKey]                       INT           NOT NULL,
    [SourceSystemCode]                    NVARCHAR (20) NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50) NULL,
    [SourceSystemEntryRef]                BIGINT        NOT NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20) NULL,
    [JourneyRef]                          NVARCHAR (18) NULL,
    [JourneyPatternId]                    NUMERIC (16)  NOT NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (20) NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (50) NULL,
    [CreatedUtcDateTime]                  DATETIME      NULL,
    [DelayCaseNumber]                     INT           NOT NULL,
    [DeviationDelayMinutes]               INT           NULL,
    [ObservedDelayMinutes]                INT           NULL,
    [OriginStopPointId]                   INT           NULL,
    [PlannedStartDateTime]                DATETIME2 (0) NULL,
    [TargetDepartureDateTimeFinal]        DATETIME2 (0) NULL,
    [ObservedDepartureDateTime]           DATETIME2 (0) NULL,
    [LineNumber]                          NVARCHAR (50) NULL,
    [ContractCode]                        NVARCHAR (20) NULL,
    [ContractorCode]                      NVARCHAR (20) NULL,
    [ObservedDelay]                       BIT           NULL,
    [DeviationDelay]                      BIT           NULL,
    [CorrectDelay]                        BIT           NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3) NULL,
    CONSTRAINT [PK_RT_JourneyDelay] PRIMARY KEY CLUSTERED ([JourneyDelayKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_JourneyDelay_SourceSystemDeviationScopeRef]
    ON [fact].[RT_JourneyDelay]([SourceSystemEntryRef] ASC);


GO

