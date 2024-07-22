
CREATE view [dim].[date_nolock] as (
 
select
    [DateKey]
   ,[DateTime2(0)] AS [DateTime]
   ,[Date]
   ,[Year]
   ,cast([Quarter] as char(11)) [Quarter]
   ,[QuarterNo]
   ,cast([Month] as varchar(16)) [Month]
   ,[MonthNo]
   ,[WeekNo]
   ,cast([Day] as varchar(32)) [Day]
   ,DayNoOfWeek
   ,[YearMonthNo]
   ,[YearQuarterNo]
   ,cast([YearMonth] as char(14)) [YearMonth]
   ,cast([YearQuarter] as char(16)) [YearQuarter]
   ,cast([YearWeekDisplayName] as varchar(50)) [YearWeekDisplayName]
   ,[YearWeekNumber]
   ,YesterdayFlag
   ,TodayFlag
   ,Last12MonthsFlag
from
    [dim].[Date] with (nolock)
	)

GO

