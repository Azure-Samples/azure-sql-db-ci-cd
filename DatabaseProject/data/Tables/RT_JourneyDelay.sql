CREATE TABLE [data].[RT_JourneyDelay] (
    [SourceSystemCode]                    NVARCHAR (20) NOT NULL,
    [DelayCaseNumber]                     INT           NOT NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50) NULL,
    [SourceSystemEntryRef]                BIGINT        NOT NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20) NULL,
    [JourneyRef]                          CHAR (18)     NOT NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (20) NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (50) NULL,
    [CreatedUtcDateTime]                  DATETIME      NULL,
    [PlannedStartDateTime]                DATETIME2 (0) NULL,
    [JourneyPatternId]                    NUMERIC (16)  NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3) NULL,
    CONSTRAINT [PK_RT_JourneyDelay] PRIMARY KEY CLUSTERED ([JourneyRef] ASC, [SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_JourneyDelay_JourneyRef_SourceSystemEntryRef]
    ON [data].[RT_JourneyDelay]([JourneyRef] ASC, [SourceSystemCode] ASC, [SourceSystemEntryRef] ASC);


GO

