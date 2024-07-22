CREATE TABLE [stg].[PAX_Productivity_LinePax] (
    [SourceSystemCode]            NVARCHAR (20)    NULL,
    [SourceSystemEntryRef]        NVARCHAR (255)   NULL,
    [LineNumber]                  NVARCHAR (255)   NULL,
    [LineDesignation]             NVARCHAR (255)   NULL,
    [IncomeGroup]                 NVARCHAR (255)   NULL,
    [CommuterLine]                NVARCHAR (255)   NULL,
    [ResponsibleOrganizationCode] NVARCHAR (255)   NULL,
    [CountingMethodCode]          NVARCHAR (20)    NULL,
    [CountingMethodName]          NVARCHAR (255)   NULL,
    [RateAreaCombinationCode]     NVARCHAR (255)   NULL,
    [RateAreaCode]                NVARCHAR (20)    NULL,
    [RateAreaName]                NVARCHAR (255)   NULL,
    [TransferDate]                DATE             NULL,
    [Year]                        INT              NULL,
    [Month]                       NVARCHAR (255)   NULL,
    [YearMonthNo]                 INT              NULL,
    [ScenarioKindCode]            NVARCHAR (20)    NULL,
    [ScenarioKindName]            NVARCHAR (255)   NULL,
    [ScenarioCode]                NVARCHAR (20)    NULL,
    [ScenarioName]                NVARCHAR (255)   NULL,
    [Total]                       DECIMAL (19, 10) NULL,
    [WeekdayAvg]                  DECIMAL (19, 10) NULL,
    [SaturdayAvg]                 DECIMAL (19, 10) NULL,
    [SundayAvg]                   DECIMAL (19, 10) NULL
);


GO

