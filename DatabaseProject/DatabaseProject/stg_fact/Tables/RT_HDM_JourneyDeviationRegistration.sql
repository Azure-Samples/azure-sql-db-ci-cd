CREATE TABLE [stg_fact].[RT_HDM_JourneyDeviationRegistration] (
    [SourceSystemEntryRef]                BIGINT         NOT NULL,
    [JourneyDateKey]                      INT            NULL,
    [LineKey]                             INT            NULL,
    [ContractKey]                         INT            NULL,
    [ContractorKey]                       INT            NULL,
    [JourneyRef]                          CHAR (18)      NULL,
    [ReportedDateTime]                    DATETIME2 (0)  NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (250) NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (250) NULL,
    [AccountingRuleKey]                   INT            NULL,
    [ReportedByInitials]                  NVARCHAR (50)  NULL,
    [RespitePeriodSeconds]                INT            NULL,
    [JourneyNumber]                       INT            NULL,
    [FromSequenceNumber]                  INT            NULL,
    [UptoSequenceNumber]                  INT            NULL,
    [Compare with Reportet + Respite]     DATETIME2 (7)  NULL,
    [IsTooLate]                           NVARCHAR (250) NULL,
    [DiffInSeconds]                       INT            NULL,
    [LastObsSequenceNumber]               INT            NULL,
    [ObservedArrivalDateTime]             DATETIME2 (0)  NULL,
    [ObservedDepartureDateTime]           DATETIME2 (0)  NULL,
    [MaxObsArrival]                       DATETIME2 (0)  NULL,
    [MaxObsDeparture]                     DATETIME2 (0)  NULL,
    [MaxPlanArrival]                      DATETIME2 (0)  NULL,
    [MaxPlanDeparture]                    DATETIME2 (0)  NULL,
    [PlannedArrivalDateTime]              DATETIME2 (0)  NULL,
    [PlannedDepartureDateTime]            DATETIME2 (0)  NULL,
    [MaxObsRow]                           INT            NULL,
    [CompareWithReported]                 DATETIME2 (0)  NULL
);


GO

