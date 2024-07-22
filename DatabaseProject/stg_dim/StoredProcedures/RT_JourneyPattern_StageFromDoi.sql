create procedure [stg_dim].[RT_JourneyPattern_StageFromDoi] as
begin

truncate table [stg_dim].[JourneyPattern];

with
[JourneyPatternPointAgg] as
(
    select
        pijp.[JourneyPatternId]
       ,[PointCount] = count(1)
       ,[StopPointCount] = count(jpp.[StopPointGid])
       ,[StopPointChecksum] = sum(case
                                      when jpp.[StopPointGid] is not null then jpp.[JourneyPatternPointNumber]
                                      else 0
                                  end
                              )
    from
        [data].[RT_DOI_PointInJourneyPattern] pijp
        left join [dim].[JourneyPatternPoint] jpp on
            jpp.[JourneyPatternPointGid] = pijp.[JourneyPatternPointGid]
            and jpp.[IsCurrent] = 1
    group by
        pijp.[JourneyPatternId]
)
insert into
    [stg_dim].[JourneyPattern]
(
    [SourceSystemCode]
   ,[SourceSystemEntryId]
   ,[RateAreaCombinationKey]
   ,[ProductGroupKey]
   ,[DefaultTransportModeKey]
   ,[LineKey]
   ,[LineDirectionKey]
   ,[ValidFromDateKey]
   ,[ValidToDateKey]
   ,[IsCurrent]
   -- Copy data from Line Direction dimension for maximum performance when joining.
   ,[RateAreaCombinationCode]
   ,[RateAreaCombinationDisplayIndex]
   ,[RateAreaCombinationDisplayName]
   ,[ProductGroupCode]
   ,[ProductGroupDisplayIndex]
   ,[ProductGroupDisplayName]
   ,[DefaultTransportModeCode]
   ,[DefaultTransportModeName]
   ,[DefaultTransportModeDisplayIndex]
   ,[DefaultTransportModeDisplayName]
   ,[LineGid]
   ,[LineNumber]
   ,[LineDesignation]
   ,[LineName]
   ,[LineDisplayIndex]
   ,[LineDisplayName]
   ,[LineDirectionGid]
   ,[LineDirectionCode]
   ,[LineDirectionName]
   ,[LineDirectionDisplayIndex]
   ,[LineDirectionDisplayName]
   -- Actual Journey Pattern Dimension
   ,[JourneyPatternId]
   ,[JourneyPatternName]
   ,[JourneyPatternDisplayName]
   ,[JourneyPatternPointCount]
   ,[JourneyPatternStopPointCount]
   ,[JourneyPatternStartStopPointNumber]
   ,[JourneyPatternStartStopPointName]
   ,[JourneyPatternEndStopPointNumber]
   ,[JourneyPatternEndStopPointName]
   ,[JourneyPatternGroupByKey]
   ,[JourneyPatternGroupByKeyAlternative]
   ,[ValidFromDate]
   ,[ValidToDate]
)
select
    [SourceSystemCode] = 'PT'
   ,[SourceSystemEntryId] = jp.[JourneyPatternId]
   ,[RateAreaCombinationKey] = d.[RateAreaCombinationKey]
   ,[ProductGroupKey] = d.[ProductGroupKey]
   ,[DefaultTransportModeKey] = d.[DefaultTransportModeKey]
   ,[LineKey] = d.[LineKey]
   ,[LineDirectionKey] = d.[LineDirectionKey]
   -- We are reusing the validity from the Line Direction dimension.
   ,[ValidFromDateKey] = d.[ValidFromDateKey]
   ,[ValidToDateKey] = d.[ValidToDateKey]
   ,[IsCurrent] = d.[IsCurrent]
   -- Copy data from Line Direction dimension for maximum performance when joining.
   ,[RateAreaCombinationCode] = d.[RateAreaCombinationCode]
   ,[RateAreaCombinationDisplayIndex] = d.[RateAreaCombinationDisplayIndex]
   ,[RateAreaCombinationDisplayName] = d.[RateAreaCombinationDisplayName]
   ,[ProductGroupCode] = d.[ProductGroupCode]
   ,[ProductGroupDisplayIndex] = d.[ProductGroupDisplayIndex]
   ,[ProductGroupDisplayName] = d.[ProductGroupDisplayName]
   ,[DefaultTransportModeCode] = d.[DefaultTransportModeCode]
   ,[DefaultTransportModeName] = d.[DefaultTransportModeName]
   ,[DefaultTransportModeDisplayIndex] = d.[DefaultTransportModeDisplayIndex]
   ,[DefaultTransportModeDisplayName] = d.[DefaultTransportModeDisplayName]
   ,[LineGid] = d.[LineGid]
   ,[LineNumber] = d.[LineNumber]
   ,[LineDesignation] = d.[LineDesignation]
   ,[LineName] = d.[LineName]
   ,[LineDisplayIndex] = d.[LineDisplayIndex]
   ,[LineDisplayName] = d.[LineDisplayName]
   ,[LineDirectionGid] = d.[LineDirectionGid]
   ,[LineDirectionCode] = d.[LineDirectionCode]
   ,[LineDirectionName] = d.[LineDirectionName]
   ,[LineDirectionDisplayIndex] = d.[LineDirectionDisplayIndex]
   ,[LineDirectionDisplayName] = d.[LineDirectionDisplayName]
   -- Actual Journey Pattern Dimension
   ,[JourneyPatternId] = jp.[JourneyPatternId]
   ,[JourneyPatternName] = calc.[JourneyPatternName]
   ,[JourneyPatternDisplayName] = cast(d.[LineDesignation] + ': ' + calc.[JourneyPatternName] as nvarchar(250))
   ,[JourneyPatternPointCount] = jp.[JourneyPatternPointCount]
   ,[JourneyPatternStopPointCount] = agg.[StopPointCount]
   ,[JourneyPatternStartStopPointNumber] = cast(jp.[JourneyPatternStartStopPointGid] % 100000 as int)
   ,[JourneyPatternStartStopPointName] = isnull(jpp1.[StopPointName], 'Ukendt stoppested')
   ,[JourneyPatternEndStopPointNumber] = cast(jp.[JourneyPatternEndStopPointGid] % 100000 as int)
   ,[JourneyPatternEndStopPointName] = isnull(jpp2.[StopPointName], 'Ukendt stoppested')
   ,[JourneyPatternGroupByKey] = cast(convert(nvarchar(8), d.[LineNumber]) + '-' + d.[LineDirectionCode] + '-'
                                      + calc.[JourneyPatternGroupByKey] as nvarchar(250))
   ,[JourneyPatternGroupByKeyAlternative] = cast(d.[LineDesignation] + '-' + d.[LineDirectionCode] + '-'
                                                 + calc.[JourneyPatternGroupByKey] as nvarchar(250))
   ,[ValidFromDate] = d.[ValidFromDate]
   ,[ValidToDate] = d.[ValidToDate]
from
    [data].[RT_DOI_JourneyPattern] jp
    left join dim.[JourneyPatternPoint] jpp1 on
        jpp1.[JourneyPatternPointGid] = jp.[JourneyPatternStartStopPointGid]
        and jpp1.[IsCurrent] = 1
    left join dim.[JourneyPatternPoint] jpp2 on
        jpp2.[JourneyPatternPointGid] = jp.[JourneyPatternEndStopPointGid]
        and jpp2.[IsCurrent] = 1
    left join [JourneyPatternPointAgg] agg on
        agg.[JourneyPatternId] = jp.[JourneyPatternId]
    join [dim].[LineDirection] d on
        d.[LineNumber] = jp.[LineNumber]
        and d.[LineDirectionCode] = jp.[LineDirectionCode]
        and d.[ValidFromDate] <= isnull(jp.[ValidToDate], '9999-12-31')
        and jp.[ValidFromDate] <= isnull(d.[ValidToDate], '9999-12-31')
        and d.[ValidFromDateKey] <> -1
    cross apply (
    select
        [JourneyPatternName] = cast(isnull(jpp1.[StopPointName], 'Ukendt stoppested') + ' - '
                                    + isnull(jpp2.[StopPointName], 'Ukendt stoppested') + ' ('
                                    + convert(nvarchar(3), agg.[StopPointCount]) + ' stop)' as nvarchar(250))
       ,[JourneyPatternGroupByKey] = cast(convert(nvarchar(9), jp.[JourneyPatternStartStopPointId] % 100000) + '-'
                                          + convert(nvarchar(3), agg.[PointCount]) + '-'
                                          + convert(nvarchar(20), agg.[StopPointChecksum]) as nvarchar(250))
) calc;

end

GO

