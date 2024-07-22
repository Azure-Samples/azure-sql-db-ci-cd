

CREATE procedure [stg_dim].[Line_StageDynamicHistoryFromDoi] as
begin

-- This is a dynamically calculated Type-2 history based on the joint 
-- history of several Type-2 tables:
-- - RT_DOI_Line
-- - RT_LineProductGroup
-- - RT_LineRateAreaCombination

truncate table [stg_dim].[Line];

with
-- This calculates the set of dates which bounds ANY changes for the line.
[LineChangeDate] as
(
    -- Bounds from Line
    select distinct
           [LineNumber]
          ,[Date] = [ValidFromDate]
    from
        [data].[RT_DOI_Line]
    union
    select distinct
           [LineNumber]
          ,[Date] = [ValidToDate]
    from
        [data].[RT_DOI_Line]
    union
    -- Bounds from ProductGroupLine
    select distinct
           [LineNumber]
          ,[Date] = [ValidFromDate]
    from
        [data].[RT_LineProductGroupFilled]
    union
    select distinct
           [LineNumber]
          ,[Date] = [ValidToDate]
    from
        [data].[RT_LineProductGroupFilled]
    union
    -- Bounds from RateAreaCombinationPerLine
    select distinct
           [LineNumber]
          ,[Date] = [ValidFromDate]
    from
        [data].[RT_LineRateAreaCombinationFilled]
    union
    select distinct
           [LineNumber]
          ,[Date] = [ValidToDate]
    from
        [data].[RT_LineRateAreaCombinationFilled]
)
-- First we set a bit indicating actual change comapred to previous row.
,
[LineChange] as
(
    select
        [SourceSystemEntryId] = l.[LineId]
       ,pg.[ProductGroupCode]
       ,r.[RateAreaCombinationCode]
       ,l.[DefaultTransportModeCode]
       ,l.[TransportAuthorityCode]
       ,l.[LineGid]
       ,l.[LineNumber]
       ,l.[LineName]
       ,l.[LineDesignation]
       ,l.[LineIsMonitored]
       ,l.[LastModifiedUtcDateTime]
       ,d.[Date]
       ,[HasChange] = case
                          when checksum(
                                   l.[LineId]
                                  ,l.[LineDesignation]
                                  ,l.[LineName]
                                  ,l.[TransportAuthorityCode]
                                  ,l.[DefaultTransportModeCode]
                                  ,pg.[ProductGroupCode]
                                  ,r.[RateAreaCombinationCode]
                                  ,l.[LineIsMonitored]
                               ) in ( null
                                     ,lag(checksum(
                                              l.[LineId]
                                             ,l.[LineDesignation]
                                             ,l.[LineName]
                                             ,l.[TransportAuthorityCode]
                                             ,l.[DefaultTransportModeCode]
                                             ,pg.[ProductGroupCode]
                                             ,r.[RateAreaCombinationCode]
                                             ,l.[LineIsMonitored]
                                          )
                                      ) over (partition by l.[LineGid] order by d.[Date])
                          ) then 0
                          else 1
                      end
    from
        [LineChangeDate] d
        join [data].[RT_DOI_Line] l on
            l.[LineNumber] = d.[LineNumber]
            and l.[ValidFromDate] <= d.[Date]
            and (d.[Date] <= l.[ValidToDate] or l.[ValidToDate] is null)
        left join [data].[RT_LineProductGroupFilled] pg on
            pg.[LineNumber] = l.[LineNumber]
            and pg.[ValidFromDate] <= d.[Date]
            and d.[Date] <= pg.[ValidToDate]
        left join [data].[RT_LineRateAreaCombinationFilled] r on
            r.[LineNumber] = l.[LineNumber]
            and r.[ValidFromDate] <= d.[Date]
            and d.[Date] <= r.[ValidToDate]
)
-- Calculate a version number for each actual version, and the total number of versions.
,
[LineVersion] as
(
    select
        *
       ,[Version] = sum([HasChange]) over (partition by [LineGid] order by [Date] rows unbounded preceding)
       ,[VersionCount] = sum([HasChange]) over (partition by [LineGid])
    from
        [LineChange]
)
insert into
    [stg_dim].[Line]
(
    [SourceSystemCode]
   ,[SourceSystemEntryId]
   ,[IsCurrent]
   ,[ProductGroupCode]
   ,[RateAreaCombinationCode]
   ,[DefaultTransportModeCode]
   ,[TransportAuthorityCode]
   ,[LineGid]
   ,[LineNumber]
   ,[LineDesignation]
   ,[LineName]
   ,[LineIsMonitored]
   ,[ValidFromDate]
   ,[ValidToDate]
   ,[LastModifiedUtcDateTime]
)
select
    [SourceSystemCode] = 'PT'
   ,[SourceSystemEntryId]
   ,[IsCurrent] = case when [Version] = [VersionCount] then 1 else 0 end
   ,[ProductGroupCode]
   ,[RateAreaCombinationCode]
   ,[DefaultTransportModeCode]
   ,[TransportAuthorityCode]
   ,[LineGid]
   ,[LineNumber]
   ,[LineDesignation]
   ,[LineName]
   ,[LineIsMonitored]
   ,[ValidFromDate] = min([Date])
   ,[ValidToDate] = max([Date])
   ,[LastModifiedUtcDateTime] = max([LastModifiedUtcDateTime])
from
    [LineVersion]
group by
    [SourceSystemEntryId]
   ,[ProductGroupCode]
   ,[RateAreaCombinationCode]
   ,[DefaultTransportModeCode]
   ,[TransportAuthorityCode]
   ,[LineGid]
   ,[LineNumber]
   ,[LineDesignation]
   ,[LineName]
   ,[LineIsMonitored]
   ,[Version]
   ,[VersionCount]
order by
    [LineNumber]
   ,[ValidFromDate];
end

GO

