CREATE TABLE [stg_fact].[PAX_Productivity_LinePax] (
    [LinePaxKey]                  INT              NULL,
    [ScenarioKey]                 INT              NULL,
    [DateKey]                     INT              NULL,
    [LineKey]                     INT              NULL,
    [StrategicNetKey]             INT              NULL,
    [SourceSystemCode]            NVARCHAR (20)    NULL,
    [SourceSystemEntryRef]        NVARCHAR (255)   NULL,
    [LineNumber]                  NVARCHAR (20)    NULL,
    [LineDesignation]             NVARCHAR (20)    NULL,
    [LineMatchMethod]             NCHAR (2)        NULL,
    [IncomeGroup]                 NVARCHAR (255)   NULL,
    [CommuterLine]                NVARCHAR (255)   NULL,
    [ResponsibleOrganizationCode] NVARCHAR (255)   NULL,
    [CountingMethodCode]          NVARCHAR (20)    NULL,
    [RateAreaCombinationCode]     NVARCHAR (20)    NULL,
    [RateAreaCode]                NVARCHAR (20)    NULL,
    [TransferDate]                DATE             NULL,
    [Year]                        INT              NULL,
    [YearMonthNo]                 INT              NULL,
    [ScenarioKindCode]            NVARCHAR (20)    NULL,
    [ScenarioCode]                NVARCHAR (20)    NULL,
    [PaxTotal]                    DECIMAL (19, 10) NULL,
    [PaxWeekdayAvg]               DECIMAL (19, 10) NULL,
    [PaxSaturdayAvg]              DECIMAL (19, 10) NULL,
    [PaxSundayAvg]                DECIMAL (19, 10) NULL,
    [PaxWeekdayTotal]             DECIMAL (19, 10) NULL,
    [PaxSaturdayTotal]            DECIMAL (19, 10) NULL,
    [PaxSundayTotal]              DECIMAL (19, 10) NULL
);


GO

