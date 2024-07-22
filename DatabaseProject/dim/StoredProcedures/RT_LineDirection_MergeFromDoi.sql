CREATE procedure [dim].[RT_LineDirection_MergeFromDoi] as
begin
with
-- This ensures that LineDirection validity honors the validity of Line (which is not ensured by PubTrans).
[LineDirectionCorrectedWithLineValidity] as
(
    select
        l.[IsCurrent]
       ,l.[RateAreaCombinationKey]
       ,l.[ProductGroupKey]
       ,l.[DefaultTransportModeKey]
       ,l.[LineKey]
       ,[LineValidFromDateKey] = l.[ValidFromDateKey]
       ,[LineValidToDateKey] = l.[ValidToDateKey]
       ,l.[SourceSystemCode]
       ,[SourceSystemEntryId] = d.[LineDirectionId]
       ,l.[RateAreaCombinationCode]
       ,l.[RateAreaCombinationDisplayIndex]
       ,l.[RateAreaCombinationDisplayName]
       ,l.[ProductGroupCode]
       ,l.[ProductGroupName]
       ,l.[ProductGroupDisplayIndex]
       ,l.[ProductGroupDisplayName]
       ,l.[DefaultTransportModeCode]
       ,l.[DefaultTransportModeName]
       ,l.[DefaultTransportModeDisplayIndex]
       ,l.[DefaultTransportModeDisplayName]
       ,l.[LineGid]
       ,l.[LineNumber]
       ,l.[LineDesignation]
       ,l.[LineName]
       ,l.[LineDisplayIndex]
       ,l.[LineDisplayName]
       ,d.[LineDirectionGid]
       ,d.[LineDirectionCode]
       ,d.[LineDirectionName]
       ,[LineDirectionDisplayIndex] = dense_rank() over (order by [LineDisplayIndex], [LineDirectionCode])
       ,[LineDirectionDisplayName] = concat(
                                         l.[LineDesignation]
                                        ,': '
                                        ,isnull(nullif(d.[LineDirectionName], ''), l.[LineName])
                                     )
       ,[ValidFromDate] = case
                              when d.[ValidFromDate] > l.[ValidFromDate] then d.[ValidFromDate]
                              else l.[ValidFromDate]
                          end
       ,[ValidToDate] = case
                            when isnull(d.[ValidToDate], '9999-12-31') < isnull(l.[ValidToDate], '9999-12-31') then
                                isnull(d.[ValidToDate], '9999-12-31')
                            else isnull(l.[ValidToDate], '9999-12-31')
                        end
    from
        [data].[RT_DOI_LineDirection] d
        -- We perform a inner join, since we do not want directions without actual lines that have existed (see Line filtering)
        join [dim].[Line] l on
            l.[SourceSystemEntryId] = d.[LineId]
    where
        -- Just en case, we only want to treat data from PubTrans.
        l.[SourceSystemCode] = 'PT'
)
,
[Source] as
(
    select
        [ValidFromDateKey] = case
                                 when d.[LineValidFromDateKey] <> -1 then cast(convert(char(8), d.[ValidFromDate], 112) as int)
                                 else -1
                             end
       ,[ValidToDateKey] = case
                               when d.[LineValidToDateKey] <> -1 then cast(convert(char(8), isnull(d.[ValidToDate], '9999-12-31'), 112) as int)
                               else -1
                           end
       ,d.*
    from
        [LineDirectionCorrectedWithLineValidity] d
)
MERGE [dim].[LineDirection] AS t
USING [Source] AS s
ON (t.[SourceSystemCode] = s.[SourceSystemCode] AND t.[SourceSystemEntryId] = s.[SourceSystemEntryId] AND t.[LineKey] = s.[LineKey])
WHEN MATCHED THEN
    UPDATE SET
        [RateAreaCombinationKey] = s.[RateAreaCombinationKey],
        [ProductGroupKey] = s.[RateAreaCombinationKey],
        [DefaultTransportModeKey] = s.[DefaultTransportModeKey],
        [LineKey] = s.[LineKey],
        [ValidFromDateKey] = s.[ValidFromDateKey],
        [ValidToDateKey] = s.[ValidToDateKey],
        [IsCurrent] = s.[IsCurrent],
        [RateAreaCombinationCode] = s.[RateAreaCombinationCode],
        [RateAreaCombinationDisplayIndex] = s.[RateAreaCombinationDisplayIndex],
        [RateAreaCombinationDisplayName] = s.[RateAreaCombinationDisplayName],
        [ProductGroupCode] = s.[ProductGroupCode],
        [ProductGroupName] = s.[ProductGroupName],
        [ProductGroupDisplayIndex] = s.[ProductGroupDisplayIndex],
        [ProductGroupDisplayName] = s.[ProductGroupDisplayName],
        [DefaultTransportModeCode] = s.[DefaultTransportModeCode],
        [DefaultTransportModeName] = s.[DefaultTransportModeName],
        [DefaultTransportModeDisplayIndex] = s.[DefaultTransportModeDisplayIndex],
        [DefaultTransportModeDisplayName] = s.[DefaultTransportModeDisplayName],
        [LineGid] = s.[LineGid],
        [LineNumber] = s.[LineNumber],
        [LineDesignation] = s.[LineDesignation],
        [LineName] = s.[LineName],
        [LineDisplayIndex] = s.[LineDisplayIndex],
        [LineDisplayName] = s.[LineDisplayName],
        [LineDirectionGid] = s.[LineDirectionGid],
        [LineDirectionCode] = s.[LineDirectionCode],
        [LineDirectionName] = s.[LineDirectionName],
        [LineDirectionDisplayIndex] = s.[LineDirectionDisplayIndex],
        [LineDirectionDisplayName] = s.[LineDirectionDisplayName],
        [ValidFromDate] = s.[ValidFromDate],
        [ValidToDate] = s.[ValidToDate]
WHEN NOT MATCHED BY TARGET THEN
    INSERT (
        [RateAreaCombinationKey],
        [ProductGroupKey],
        [DefaultTransportModeKey],
        [LineKey],
        [ValidFromDateKey],
        [ValidToDateKey],
        [IsCurrent],
        [SourceSystemCode],
        [SourceSystemEntryId],
        [RateAreaCombinationCode],
        [RateAreaCombinationDisplayIndex],
        [RateAreaCombinationDisplayName],
        [ProductGroupCode],
        [ProductGroupName],
        [ProductGroupDisplayIndex],
        [ProductGroupDisplayName],
        [DefaultTransportModeCode],
        [DefaultTransportModeName],
        [DefaultTransportModeDisplayIndex],
        [DefaultTransportModeDisplayName],
        [LineGid], 
        [LineNumber],
        [LineDesignation],
        [LineName],
        [LineDisplayIndex],
        [LineDisplayName],
        [LineDirectionGid],
        [LineDirectionCode],
        [LineDirectionName],
        [LineDirectionDisplayIndex],
        [LineDirectionDisplayName],
        [ValidFromDate],
        [ValidToDate]
    )
    VALUES (
        s.[RateAreaCombinationKey],
        s.[ProductGroupKey],
        s.[DefaultTransportModeKey],
        s.[LineKey],
        s.[ValidFromDateKey],
        s.[ValidToDateKey],
        s.[IsCurrent],
        s.[SourceSystemCode],
        s.[SourceSystemEntryId],
        s.[RateAreaCombinationCode],
        s.[RateAreaCombinationDisplayIndex],
        s.[RateAreaCombinationDisplayName],
        s.[ProductGroupCode],
        s.[ProductGroupName],
        s.[ProductGroupDisplayIndex],
        s.[ProductGroupDisplayName],
        s.[DefaultTransportModeCode],
        s.[DefaultTransportModeName],
        s.[DefaultTransportModeDisplayIndex],
        s.[DefaultTransportModeDisplayName],
        s.[LineGid], 
        s.[LineNumber],
        s.[LineDesignation],
        s.[LineName],
        s.[LineDisplayIndex],
        s.[LineDisplayName],
        s.[LineDirectionGid],
        s.[LineDirectionCode],
        s.[LineDirectionName],
        s.[LineDirectionDisplayIndex],
        s.[LineDirectionDisplayName],
        s.[ValidFromDate],
        s.[ValidToDate]
    )
when not matched by source and t.[SourceSystemCode] = 'PT' then
    update set
        [ValidFromDateKey] = -1,
        [ValidToDateKey] = -1,
        [IsCurrent] = 0;

/* Update LineDirectionDisplayName and LineDirectionDisplayIndex */
with
[DisplayName] as
(
    select
        [LineKey]
       ,[LineNumber]
       ,[LineDesignation]
       ,[LineDisplayIndex]
       ,[LineDirectionCode]
       ,[LineDirectionDisplayName]
       ,[LineDirectionDisplayIndex]
       ,[LineDirectionDisplayName_] = case
                                 when [LineKey] = -1 then ld.[LineName]
                                 else
                                     first_value(
                                         concat(
                                             ld.[LineDesignation]
                                            ,': '
                                            ,isnull(nullif(ld.[LineDirectionName], ''), ld.[LineName])
                                         )
                                     ) over (partition by
                                                 ld.[LineDisplayIndex]
                                                ,[LineDirectionCode]
                                             order by
                                                 [ValidFromDate] desc
                                       )
                             end
    from
        [dim].[LineDirection] ld
)
,
[DisplayIndex] as
(
    select
        [LineDirectionDisplayName]
       ,[LineDirectionDisplayIndex]
       ,[LineDirectionDisplayName_]
       ,[LineDirectionDisplayIndex_] = dense_rank() over (order by [LineDisplayIndex], [LineDirectionCode], [LineDirectionDisplayName_])
    from
        [DisplayName]
)
update
    [DisplayIndex]
set
    [LineDirectionDisplayName] = [LineDirectionDisplayName_]
   ,[LineDirectionDisplayIndex] = [LineDirectionDisplayIndex_];

end

GO

