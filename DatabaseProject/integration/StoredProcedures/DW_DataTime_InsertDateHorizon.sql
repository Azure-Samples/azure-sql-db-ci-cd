-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-07-15
-- Description: Adds dates to dim.Date given the specificed start date (leave null for today) and number of years.
-- =============================================
CREATE procedure [integration].[DW_DataTime_InsertDateHorizon] (@StartDate date = null, @NumberOfYears int = 3)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;
	set language 'Danish';
	set datefirst 1

    if @StartDate is null
        set @StartDate = getdate() at time zone 'UTC' at time zone 'Central European Standard Time';

    declare @CutoffDate date = dateadd(year, @NumberOfYears, @StartDate);


    insert into
        [dim].[Date] ([DateKey], [Date], [DateTime], [DateTime2(0)], [DateTime2(7)])
    select
        [DateKey] = cast(format(d, 'yyyyMMdd') as int)
       ,[Date] = d
       ,[DateTime] = convert(datetime, d)
       ,[DateTime2(0)] = convert(datetime2(0), d)
       ,[DateTime2(7)] = convert(datetime2(7), d)
    from (
        select
            d = dateadd(day, rn - 1, @StartDate)
        from (
            select top (datediff(day, @StartDate, @CutoffDate))
                   rn = row_number() over (order by s1.object_id)
            from
                sys.all_objects as s1
                cross join sys.all_objects as s2
            order by
                s1.object_id
        ) as x
    ) as y
        left join dim.Date existing on
            existing.Date = d
    where
        existing.Date is null;

	-- Update derived attributes

	-- Step I
	update
		[dim].[Date]
	set
		[Day] = datename(weekday, [Date]),
		[DayNoOfWeek] = datepart(weekday, [Date]),
		[DayNoOfMonth] = datepart(day, [Date]),
		[DayNoOfYear] = datepart(dayofyear, [Date]),
		[WeekNo] = datepart(iso_week, [Date]),
		[Month] = datename(month, [Date]),
		[MonthNo] = datepart(month, [Date]),
		[Year] = datepart(year, [Date]);

	-- Step II
	update
		[dim].[Date]
	set
		[Quarter] = case
			when ([MonthNo] between 1 and 3) then 'jan. - mar.'
			when ([MonthNo] between 4 and 6) then 'apr. - jun.'
			when ([MonthNo] between 7 and 9) then 'jul. - sep.'
			when ([MonthNo] between 10 and 12) then 'okt. - dec.'
			else '¤'
		end,
		[QuarterNo] = case
			when ([MonthNo] between 1 and 3) then 1
			when ([MonthNo] between 4 and 6) then 2
			when ([MonthNo] between 7 and 9) then 3
			when ([MonthNo] between 10 and 12) then 4
			else 0
		end;

	-- Step III
	update
		[dim].[Date]
	set
		[YearWeekCode] = cast(case
			when [WeekNo] > 1 and [DayNoOfYear] <= 4 then [Year] - 1
			when [WeekNo] = 1 and [DayNoOfYear] > 360 then [Year] + 1
			else [Year]
		end as nvarchar(4)) + 'W' + right('0' + cast([WeekNo] as nvarchar(2)), 2),
		[YearWeekNumber] = cast(cast(case
			when [WeekNo] > 1 and [DayNoOfYear] <= 4 then [Year] - 1
			when [WeekNo] = 1 and [DayNoOfYear] > 360 then [Year] + 1
			else [Year]
		end as nvarchar(4)) + right('0' + cast([WeekNo] as nvarchar(2)), 2) as int),
		[YearWeekDisplayName] = concat('Uge ', [WeekNo], ', ', case
			when [WeekNo] > 1 and [DayNoOfYear] <= 4 then [Year] - 1
			when [WeekNo] = 1 and [DayNoOfYear] > 360 then [Year] + 1
			else [Year]
		end),
		[YearMonthNo] = case
			when ([MonthNo] between 1 and 9) then
				cast(cast(datepart(year, [Date]) as nvarchar(4)) + '0'
						+ cast(datepart(month, [Date]) as nvarchar(2)) as integer)
			when ([MonthNo] between 10 and 12) then
				cast(cast(datepart(year, [Date]) as nvarchar(4))
						+ cast(datepart(month, [Date]) as nvarchar(2)) as integer)
			else 999999
		end,
		[YearQuarterNo] = cast(cast(datepart(year, [Date]) as nvarchar(4)) + cast(datepart(quarter, [Date]) as nvarchar(1)) as integer),
		[YearMonth] = concat(cast(datename(month, [Date]) as nvarchar(9)), ' ', cast(datepart(year, [Date]) as nvarchar(4))),
		[YearQuarter] = case
			when ([MonthNo] between 1 and 3) then
				concat('jan. - mar. ', cast(datepart(year, [Date]) as nvarchar(4)))
			when ([MonthNo] between 4 and 6) then
				concat('apr. - jun. ', cast(datepart(year, [Date]) as nvarchar(4)))
			when ([MonthNo] between 7 and 9) then
				concat('jul. - sep. ', cast(datepart(year, [Date]) as nvarchar(4)))
			when ([MonthNo] between 10 and 12) then
				concat('okt. - dec. ', cast(datepart(year, [Date]) as nvarchar(4)))
			else '¤'
		end;

end;

GO

