create view [data].[RT_LineRateAreaCombinationFilled] as
with
[LineRateAreaCombination] as
(
    select distinct
           [LineNumber]
          ,[ValidFromDate]
          ,[ValidToDate]
          ,[RateAreaCombinationCode]
    from
        [data].[RT_RateAreaPerLine]
)
,
[LineRateAreaCombinationFillForward] as
(
    select distinct
           [LineNumber]
          ,[ValidFromDate]
          ,[ValidToDate] = isnull(
                               dateadd(
                                   day
                                  ,-1
                                  ,lead([ValidFromDate]) over (partition by [LineNumber] order by [ValidFromDate])
                               )
                              ,'9999-12-31'
                           )
          ,[RateAreaCombinationCode]
    from
        [LineRateAreaCombination]
)
,
[LineRateAreaCombinationFillStartGab] as
(
    select distinct
           [LineNumber]
          ,[ValidFromDate] = '1900-01-01'
          ,[ValidToDate] = dateadd(
                               day
                              ,-1
                              ,first_value([ValidFromDate]) over (partition by [LineNumber] order by [ValidFromDate])
                           )
          ,[RateAreaCombinationCode] = first_value([RateAreaCombinationCode]) over (partition by [LineNumber] order by [ValidFromDate])
    from
        [LineRateAreaCombination]
)
select
    [LineNumber]
   ,[ValidFromDate]
   ,[ValidToDate]
   ,[RateAreaCombinationCode]
from
    [LineRateAreaCombinationFillForward]
where
    [ValidFromDate] <= [ValidToDate]
union all
select
    [LineNumber]
   ,[ValidFromDate]
   ,[ValidToDate]
   ,[RateAreaCombinationCode]
from
    [LineRateAreaCombinationFillStartGab]
where
    [ValidFromDate] <= [ValidToDate];

GO

