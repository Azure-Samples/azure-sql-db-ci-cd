CREATE TABLE [fact].[PAX_Productivity_LinePax] (
    [LinePaxKey]                  INT              IDENTITY (1, 1) NOT NULL,
    [ScenarioKey]                 INT              NOT NULL,
    [DateKey]                     INT              NOT NULL,
    [LineKey]                     INT              NOT NULL,
    [StrategicNetKey]             INT              CONSTRAINT [DF_PAX_Productivity_LinePax_StrategicNetKey] DEFAULT ((-1)) NOT NULL,
    [SourceSystemCode]            NVARCHAR (20)    NOT NULL,
    [SourceSystemEntryRef]        NVARCHAR (255)   NOT NULL,
    [YearMonthNo]                 INT              NULL,
    [LineNumber]                  NVARCHAR (20)    NULL,
    [LineDesignation]             NVARCHAR (20)    NULL,
    [LineMatchMethod]             NCHAR (2)        NULL,
    [IncomeGroup]                 NVARCHAR (255)   NULL,
    [CommuterLine]                NVARCHAR (255)   NULL,
    [ResponsibleOrganizationCode] NVARCHAR (255)   NULL,
    [CountingMethodCode]          NVARCHAR (20)    NULL,
    [RateAreaCombinationCode]     NVARCHAR (20)    NULL,
    [RateAreaCode]                NVARCHAR (20)    NULL,
    [ScenarioCode]                NVARCHAR (20)    NULL,
    [TransferDate]                DATE             NULL,
    [PaxTotal]                    DECIMAL (19, 10) NOT NULL,
    [PaxWeekdayAvg]               DECIMAL (19, 10) NOT NULL,
    [PaxSaturdayAvg]              DECIMAL (19, 10) NOT NULL,
    [PaxSundayAvg]                DECIMAL (19, 10) NOT NULL,
    [PaxWeekdayTotal]             DECIMAL (19, 10) NULL,
    [PaxSaturdayTotal]            DECIMAL (19, 10) NULL,
    [PaxSundayTotal]              DECIMAL (19, 10) NULL,
    CONSTRAINT [PK_PAX_Productivity_LinePax] PRIMARY KEY CLUSTERED ([LinePaxKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_PAX_Productivity_LinePax_SourceSystemCode_SourceSystemEntryRef]
    ON [fact].[PAX_Productivity_LinePax]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC);


GO

