CREATE TABLE [stg].[RT_JourneyDelay] (
    [JourneyRef]                          CHAR (18)     NULL,
    [SourceSystemCode]                    NVARCHAR (20) NULL,
    [SourceSystemEntryRef]                BIGINT        NULL,
    [DelayCaseNumber]                     INT           NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50) NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20) NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (20) NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (50) NULL,
    [CreatedUtcDateTime]                  DATETIME      NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3) NULL,
    [PlannedStartDateTime]                DATETIME2 (0) NULL,
    [JourneyPatternId]                    NUMERIC (16)  NULL
);


GO

