CREATE procedure [dim].[RT_JourneyPattern_Merge] (@SourceSystemCode nvarchar(20))
as
begin

    merge [dim].[JourneyPattern] as t
    using [stg_dim].[JourneyPattern] as s
    on (
        t.[SourceSystemCode] = s.[SourceSystemCode]
        and t.[SourceSystemEntryId] = s.[SourceSystemEntryId]
        and t.[LineDirectionKey] = s.[LineDirectionKey]
    )
    when matched then update set
                          [RateAreaCombinationKey] = s.[RateAreaCombinationKey]
                         ,[ProductGroupKey] = s.[ProductGroupKey]
                         ,[DefaultTransportModeKey] = s.[DefaultTransportModeKey]
                         ,[LineKey] = s.[LineKey]
                         ,[LineDirectionKey] = s.[LineDirectionKey]
                         ,[ValidFromDateKey] = s.[ValidFromDateKey]
                         ,[ValidToDateKey] = s.[ValidToDateKey]
                         ,[IsCurrent] = s.[IsCurrent]
                         ,[RateAreaCombinationCode] = s.[RateAreaCombinationCode]
                         ,[RateAreaCombinationDisplayIndex] = s.[RateAreaCombinationDisplayIndex]
                         ,[RateAreaCombinationDisplayName] = s.[RateAreaCombinationDisplayName]
                         ,[ProductGroupCode] = s.[ProductGroupCode]
                         ,[ProductGroupDisplayIndex] = s.[ProductGroupDisplayIndex]
                         ,[ProductGroupDisplayName] = s.[ProductGroupDisplayName]
                         ,[DefaultTransportModeCode] = s.[DefaultTransportModeCode]
                         ,[DefaultTransportModeName] = s.[DefaultTransportModeName]
                         ,[DefaultTransportModeDisplayIndex] = s.[DefaultTransportModeDisplayIndex]
                         ,[DefaultTransportModeDisplayName] = s.[DefaultTransportModeDisplayName]
                         ,[LineGid] = s.[LineGid]
                         ,[LineNumber] = s.[LineNumber]
                         ,[LineDesignation] = s.[LineDesignation]
                         ,[LineName] = s.[LineName]
                         ,[LineDisplayIndex] = s.[LineDisplayIndex]
                         ,[LineDisplayName] = s.[LineDisplayName]
                         ,[LineDirectionGid] = s.[LineDirectionGid]
                         ,[LineDirectionCode] = s.[LineDirectionCode]
                         ,[LineDirectionName] = s.[LineDirectionName]
                         ,[LineDirectionDisplayIndex] = s.[LineDirectionDisplayIndex]
                         ,[LineDirectionDisplayName] = s.[LineDirectionDisplayName]
                         ,[JourneyPatternId] = s.[JourneyPatternId]
                         ,[JourneyPatternName] = s.[JourneyPatternName]
                         ,[JourneyPatternDisplayName] = s.[JourneyPatternDisplayName]
                         ,[JourneyPatternPointCount] = s.[JourneyPatternPointCount]
                         ,[JourneyPatternStartStopPointNumber] = s.[JourneyPatternStartStopPointNumber]
                         ,[JourneyPatternStartStopPointName] = s.[JourneyPatternStartStopPointName]
                         ,[JourneyPatternEndStopPointNumber] = s.[JourneyPatternEndStopPointNumber]
                         ,[JourneyPatternEndStopPointName] = s.[JourneyPatternEndStopPointName]
                         ,[JourneyPatternStopPointCount] = s.[JourneyPatternStopPointCount]
                         ,[JourneyPatternGroupByKey] = s.[JourneyPatternGroupByKey]
                         ,[JourneyPatternGroupByKeyAlternative] = s.[JourneyPatternGroupByKeyAlternative]
                         ,[ValidFromDate] = s.[ValidFromDate]
                         ,[ValidToDate] = s.[ValidToDate]
    when not matched by target then
        insert (
            [RateAreaCombinationKey]
           ,[ProductGroupKey]
           ,[DefaultTransportModeKey]
           ,[LineKey]
           ,[LineDirectionKey]
           ,[ValidFromDateKey]
           ,[ValidToDateKey]
           ,[IsCurrent]
           ,[SourceSystemCode]
           ,[SourceSystemEntryId]
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
        values
        (
            s.[RateAreaCombinationKey], s.[ProductGroupKey], s.[DefaultTransportModeKey], s.[LineKey]
           ,s.[LineDirectionKey], s.[ValidFromDateKey], s.[ValidToDateKey], s.[IsCurrent], s.[SourceSystemCode]
           ,s.[SourceSystemEntryId], s.[RateAreaCombinationCode], s.[RateAreaCombinationDisplayIndex]
           ,s.[RateAreaCombinationDisplayName], s.[ProductGroupCode], s.[ProductGroupDisplayIndex]
           ,s.[ProductGroupDisplayName], s.[DefaultTransportModeCode], s.[DefaultTransportModeName]
           ,s.[DefaultTransportModeDisplayIndex], s.[DefaultTransportModeDisplayName], s.[LineGid], s.[LineNumber]
           ,s.[LineDesignation], s.[LineName], s.[LineDisplayIndex], s.[LineDisplayName], s.[LineDirectionGid]
           ,s.[LineDirectionCode], s.[LineDirectionName], s.[LineDirectionDisplayIndex], s.[LineDirectionDisplayName]
           ,s.[JourneyPatternId], s.[JourneyPatternName], s.[JourneyPatternDisplayName], s.[JourneyPatternPointCount]
           ,s.[JourneyPatternStopPointCount], s.[JourneyPatternStartStopPointNumber]
           ,s.[JourneyPatternStartStopPointName], s.[JourneyPatternEndStopPointNumber]
           ,s.[JourneyPatternEndStopPointName], s.[JourneyPatternGroupByKey], s.[JourneyPatternGroupByKeyAlternative]
           ,s.[ValidFromDate], s.[ValidToDate]
        )
    when not matched by source and t.[SourceSystemCode] = @SourceSystemCode then update set
                                                                                     [ValidFromDateKey] = -1
                                                                                    ,[ValidToDateKey] = -1
                                                                                    ,[IsCurrent] = 0;

    truncate table [stg_dim].[JourneyPattern];

end;

GO

