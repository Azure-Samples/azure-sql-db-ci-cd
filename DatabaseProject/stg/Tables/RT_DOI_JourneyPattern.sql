CREATE TABLE [stg].[RT_DOI_JourneyPattern] (
    [JourneyPatternRef]               NVARCHAR (20)  NULL,
    [ValidFromDate]                   DATE           NULL,
    [ValidToDate]                     DATE           NULL,
    [LineNumber]                      NUMERIC (4)    NULL,
    [LineDesignation]                 NVARCHAR (8)   NULL,
    [LineName]                        NVARCHAR (250) NULL,
    [LineDirectionCode]               NVARCHAR (20)  NULL,
    [LineDirectionName]               NVARCHAR (250) NULL,
    [JourneyPatternId]                BIGINT         NULL,
    [JourneyPatternPointCount]        SMALLINT       NULL,
    [JourneyPatternStartStopPointId]  INT            NULL,
    [JourneyPatternEndStopPointId]    INT            NULL,
    [JourneyPatternStartStopPointGid] NUMERIC (16)   NULL,
    [JourneyPatternEndStopPointGid]   NUMERIC (16)   NULL,
    [SourceSystemCode]                NVARCHAR (20)  NULL,
    [SourceSystemJourneyPatternRef]   NVARCHAR (20)  NULL,
    [SourceSystemLineDirectionRef]    NVARCHAR (20)  NULL,
    [SourceSystemLineEntryRef]        NVARCHAR (20)  NULL
);


GO

