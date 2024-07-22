CREATE TABLE [dim].[Date] (
    [DateKey]               INT            NOT NULL,
    [Date]                  DATE           NOT NULL,
    [DateTime]              DATETIME       NOT NULL,
    [DateTime2(0)]          DATETIME2 (0)  NOT NULL,
    [DateTime2(7)]          DATETIME2 (7)  NOT NULL,
    [YesterdayFlag]         BIT            NULL,
    [TodayFlag]             BIT            NULL,
    [TomorrowFlag]          BIT            NULL,
    [FirstDayOfMonthFlag]   BIT            NULL,
    [LastDayOfMonthFlag]    BIT            NULL,
    [Year]                  INT            NULL,
    [Quarter]               NCHAR (11)     NULL,
    [QuarterNo]             TINYINT        NULL,
    [Month]                 NVARCHAR (16)  NULL,
    [MonthNo]               TINYINT        NULL,
    [WeekNo]                TINYINT        NULL,
    [Day]                   NVARCHAR (16)  NULL,
    [DayNoOfWeek]           TINYINT        NULL,
    [DayNoOfMonth]          TINYINT        NULL,
    [DayNoOfYear]           SMALLINT       NULL,
    [YearMonthNo]           INT            NULL,
    [YearQuarterNo]         INT            NULL,
    [YearMonth]             NCHAR (14)     NULL,
    [YearQuarter]           NCHAR (16)     NULL,
    [Last7DaysFlag]         BIT            NULL,
    [Last14DaysFlag]        BIT            NULL,
    [Last4WeeksFlag]        BIT            NULL,
    [Last8WeeksFlag]        BIT            NULL,
    [Last12MonthsFlag]      BIT            NULL,
    [CurrentWeekFlag]       BIT            NULL,
    [CurrentMonthFlag]      BIT            NULL,
    [CurrentQuarterFlag]    BIT            NULL,
    [CurrentYearFlag]       BIT            NULL,
    [CurrentYearBeginFlag]  BIT            NULL,
    [CurrentYearEndFlag]    BIT            NULL,
    [CurrentYearToDateFlag] BIT            NULL,
    [DstFlag]               BIT            NULL,
    [StandardHours]         DECIMAL (9, 2) NULL,
    [YearWeekCode]          NCHAR (7)      NULL,
    [YearWeekNumber]        INT            NULL,
    [YearWeekDisplayName]   NVARCHAR (50)  NULL,
    [IsHoliday]             BIT            NULL,
    [HolidayName]           VARCHAR (20)   NULL,
    CONSTRAINT [PK_Date] PRIMARY KEY CLUSTERED ([DateKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [Date]
    ON [dim].[Date]([Date] ASC)
    INCLUDE([Year], [Quarter], [QuarterNo], [Month], [MonthNo], [WeekNo], [Day], [DayNoOfWeek], [DayNoOfMonth], [DayNoOfYear], [YearMonthNo], [YearQuarterNo], [YearMonth], [YearQuarter], [YearWeekCode], [YearWeekNumber], [YearWeekDisplayName]);


GO

