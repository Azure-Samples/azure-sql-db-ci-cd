CREATE TABLE [fact].[RT_HDM_JourneyDeviationRegistration] (
    [SourceSystemEntryRef] BIGINT         NOT NULL,
    [JourneyDateKey]       INT            NULL,
    [MaxPlanDeparture]     DATETIME2 (0)  NULL,
    [ReportedDateTime]     DATETIME2 (0)  NULL,
    [LineKey]              INT            NULL,
    [ContractKey]          INT            NULL,
    [ContractorKey]        INT            NULL,
    [AccountingRuleKey]    INT            NULL,
    [ReportedByInitials]   NVARCHAR (50)  NULL,
    [RespitePeriodSeconds] INT            NULL,
    [JourneyNumber]        INT            NULL,
    [FromSequenceNumber]   INT            NULL,
    [UptoSequenceNumber]   INT            NULL,
    [IsTooLate]            NVARCHAR (250) NULL,
    [DiffInSeconds]        INT            NULL,
    [CompareWithReported]  DATETIME2 (0)  NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (32) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_HDM_JourneyDeviationRegistration_Merge]
    ON [fact].[RT_HDM_JourneyDeviationRegistration]([SourceSystemEntryRef] ASC)
    INCLUDE([RespitePeriodSeconds], [FromSequenceNumber], [CompareWithReported]);


GO

