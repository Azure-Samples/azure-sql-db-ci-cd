

create view [fact].[PAX_Productivity_LinePax_Budget]
as
with
    _line as
    (
        select
            l.LineDesignation as LineDesignation_LinesOfInterest
        from
            [data].[RT_LinesOfInterest] il
            inner join dim.line l on
                l.LineNumber = il.LineNumber
    )
,
    _a as
    (
        select
            f.*
           ,il.LineDesignation_LinesOfInterest
        from
            [fact].[PAX_Productivity_LinePax] f
            join dim.Date d on
                d.DateKey = f.DateKey
            inner join _line il on
                concat(cast(il.LineDesignation_LinesOfInterest as nvarchar(20)), ' ', 'B') = f.LineDesignation
                or cast(il.LineDesignation_LinesOfInterest as nvarchar(20)) = f.LineDesignation
        where
            d.Date <= dateadd(yy, datediff(yy, 0, getdate()) + 1, -1)
            --d.Date <= getdate()
            and f.DateKey >= '20180101'
            -- and StrategicNetKey = -1
            and f.ScenarioCode like '%B%'
    )
select distinct
*
   -- LineNumber
   --,LineDesignation
   --,LineDesignation_LinesOfInterest
from
    _a
;

GO

