create view [data].[RT_LineProductGroupFilled]
as
with
-- This just fills forward to next version to void any in-between and end gaps
[LineProductFillForward] as
(
    select
        [LineNumber]
       ,[ValidFromDate]
       ,[ValidToDate] = isnull(dateadd(day, -1, lead([ValidFromDate]) over (partition by [LineNumber] order by [ValidFromDate])), '9999-12-31')
       ,[ProductGroupCode]
    from
        [data].[RT_LineProductGroup]
),
-- This just produces a repetation of backward from the first known version.
[LineProductGroupFillStartGap] as (
    select distinct
        [LineNumber]
       ,[ValidFromDate] = '1900-01-01'
       ,[ValidToDate] = dateadd(day, -1, first_value([ValidFromDate]) over (partition by [LineNumber] order by [ValidFromDate]))
       ,[ProductGroupCode] = first_value([ProductGroupCode]) over (partition by [LineNumber] order by [ValidFromDate])
    from
        [data].[RT_LineProductGroup]

)
select
    [LineNumber]
   ,[ValidFromDate]
   ,[ValidToDate]
   ,[ProductGroupCode]
from
    [LineProductGroupFillStartGap]
where
    [ValidFromDate] <= [ValidToDate]
union all
select
    [LineNumber]
   ,[ValidFromDate]
   ,[ValidToDate]
   ,[ProductGroupCode]
from
    [LineProductFillForward]
where
    [ValidFromDate] <= [ValidToDate];

GO

