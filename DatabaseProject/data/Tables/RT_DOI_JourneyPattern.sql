CREATE TABLE [data].[RT_DOI_JourneyPattern] (
    [JourneyPatternRef]               NVARCHAR (20)  NOT NULL,
    [ValidFromDate]                   DATE           NOT NULL,
    [ValidToDate]                     DATE           NULL,
    [LineNumber]                      NUMERIC (4)    NOT NULL,
    [LineDesignation]                 NVARCHAR (8)   NOT NULL,
    [LineName]                        NVARCHAR (250) NULL,
    [LineDirectionCode]               NVARCHAR (20)  NOT NULL,
    [LineDirectionName]               NVARCHAR (250) NULL,
    [JourneyPatternId]                BIGINT         NULL,
    [JourneyPatternPointCount]        SMALLINT       NULL,
    [JourneyPatternStartStopPointId]  INT            NULL,
    [JourneyPatternEndStopPointId]    INT            NULL,
    [JourneyPatternStartStopPointGid] NUMERIC (16)   NOT NULL,
    [JourneyPatternEndStopPointGid]   NUMERIC (16)   NOT NULL,
    [SourceSystemCode]                NVARCHAR (20)  NOT NULL,
    [SourceSystemJourneyPatternRef]   NVARCHAR (20)  NULL,
    [SourceSystemLineDirectionRef]    NVARCHAR (20)  NULL,
    [SourceSystemLineEntryRef]        NVARCHAR (20)  NULL,
    [Inserted]                        DATETIME2 (0)  NOT NULL,
    [Updated]                         DATETIME2 (0)  NOT NULL,
    [ManualOverride]                  BIT            CONSTRAINT [DF_RT_DOI_JourneyPattern_ManualOverride] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_RT_JourneyPattern] PRIMARY KEY CLUSTERED ([JourneyPatternRef] ASC, [ValidFromDate] ASC)
);


GO

