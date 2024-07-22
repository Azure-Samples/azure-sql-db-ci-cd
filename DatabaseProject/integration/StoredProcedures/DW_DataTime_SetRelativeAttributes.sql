
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-07-15
-- Description: Set relative attributes based on "today"-parameter (leave null for today).
-- =============================================
CREATE procedure [integration].[DW_DataTime_SetRelativeAttributes] (@Today date = null)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    if @Today is null
        set @Today = getdate()at time zone 'UTC' at time zone 'Central European Standard Time';

    -- ===========================
    -- Reset
    -- ===========================

    update
        [dim].[Date]
    set
        [YesterdayFlag] = 0
       ,[TodayFlag] = 0
       ,[TomorrowFlag] = 0
       ,[CurrentWeekFlag] = 0
       ,[CurrentMonthFlag] = 0
       ,[CurrentQuarterFlag] = 0
       ,[CurrentYearFlag] = 0
       ,[CurrentYearToDateFlag] = 0
       ,[CurrentYearBeginFlag] = 0
       ,[CurrentYearEndFlag] = 0
       ,[Last7DaysFlag] = 0
       ,[Last14DaysFlag] = 0
       ,[Last4WeeksFlag] = 0
       ,[Last8WeeksFlag] = 0
       ,[Last12MonthsFlag] = 0
	   ,[FirstDayOfMonthFlag] = 0
	   ,[LastDayOfMonthFlag] = 0;

    -- ===========================
    -- Set today related flags
    -- ===========================

    -- Today Flag
    update
        [dim].[Date]
    set
        [TodayFlag] = 1
    where
        [Date] = @Today;

    -- Yesterday Flag
    update
        [dim].[Date]
    set
        [YesterdayFlag] = 1
    where
        [Date] = dateadd(day, -1, @Today);

    -- Tomorow Flag
    update
        [dim].[Date]
    set
        [TomorrowFlag] = 1
    where
        [Date] = dateadd(day, 1, @Today);

    -- Set Current Week Flag.
    update
        [dim].[Date]
    set
        [CurrentWeekFlag] = 1
    where
        ([Year] = datepart(year, @Today) and [WeekNo] = datepart(iso_week, @Today));

    -- Set Current Month Flag.
    update
        [dim].[Date]
    set
        [CurrentMonthFlag] = 1
    where
        ([Year] = datepart(year, @Today) and [MonthNo] = datepart(month, @Today));

    -- Set Current Quarter Flag.
    update
        [dim].[Date]
    set
        [CurrentQuarterFlag] = 1
    where
        (
        [Year] = datepart(year, @Today)
        and [QuarterNo] = datepart(quarter, @Today)
    );

    -- Set Current Year Flag.
    update
        [dim].[Date]
    set
        [CurrentYearFlag] = 1
    --Where  ([Year] = CAST(Year(GETDATE()) AS INTEGER))
    where
        ([Year] = datepart(year, @Today));

    -- Set Current Year To Date Flag
    update
        [dim].[Date]
    set
        [CurrentYearToDateFlag] = 1
    where
        (
        [Year] = datepart(year, @Today)
        and [dim].[Date].[Date] between (dateadd(year, datediff(year, 0, @Today), 0)) and @Today
    );

    -- ===============================
    -- Set Rolling Gregorian Calendar Periods.
    -- ===============================

    -- Set Last 7 Days Flag
    update
        [dim].[Date]
    set
        [Last7DaysFlag] = 1
    where
        ([dim].[Date].[Date] between dateadd(day, -6, @Today) and @Today);

    -- Set Last 14 Days Flag
    update
        [dim].[Date]
    set
        [Last14DaysFlag] = 1
    where
        ([dim].[Date].[Date] between dateadd(day, -14, @Today) and @Today);

    -- Set Last 4 Weeks Flag
    update
        [dim].[Date]
    set
        [Last4WeeksFlag] = 1
    where
        ([dim].[Date].[Date] between dateadd(week, -4, @Today) and @Today);

    -- Set Last 8 Weeks Flag
    update
        [dim].[Date]
    set
        [Last8WeeksFlag] = 1
    where
        ([dim].[Date].[Date] between dateadd(week, -8, @Today) and @Today);

    -- Set Last 12 Months Flag
    update
        [dim].[Date]
    set
        [Last12MonthsFlag] = 1
    where
        ([dim].[Date].[Date] between dateadd(month, -12, @Today) and @Today);


    -- ==========================
    -- Set Various Begin/End Flags.
    -- ==========================

    -- Set Current Year Begin/End Flag
    update
        [dim].[Date]
    set
        [CurrentYearBeginFlag] = 1
    where
        ([dim].[Date].[Date] = dateadd(year, datediff(year, 0, @Today), 0));

    update
        [dim].[Date]
    set
        [CurrentYearEndFlag] = 1
    where
        ([dim].[Date].[Date] = dateadd(year, datediff(year, 0, @Today) + 1, -1));

    -- Set First- and Last Day of Month Flag 
    update
        [dim].[Date]
    set
        [FirstDayOfMonthFlag] = 1
    where
        ([dim].[Date].[Date] = dateadd(month, datediff(month, 0, [dim].[Date].[DateTime]), 0));

    update
        [dim].[Date]
    set
        [LastDayOfMonthFlag] = 1
    where
        ([dim].[Date].[Date] = cast(dateadd(
                                        day
                                       ,- (day(dateadd(month, 1, [dim].[Date].[DateTime])))
                                       ,dateadd(month, 1, [dim].[Date].[DateTime])
                                    ) as date)
    )
        and [DateKey] < 99991201;

    -- The before statement cannot handle the last date (9999.12.31) due to overflow, thus we do it manually.
    update
        [dim].[Date]
    set
        [LastDayOfMonthFlag] = 1
    where
        [dim].[Date].[DateKey] = 99991231;

	-- ==============================================

end;

GO

