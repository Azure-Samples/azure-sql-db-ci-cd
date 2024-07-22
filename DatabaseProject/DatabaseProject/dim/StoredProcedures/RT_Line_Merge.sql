CREATE procedure [dim].[RT_Line_Merge] (
    @SourceSystemCode nvarchar(20)
) as
begin
merge [dim].[Line] as t
using [stg_dim].[Line] as s
on (t.[SourceSystemCode] = s.[SourceSystemCode] and t.[SourceSystemEntryId] = s.[SourceSystemEntryId] and t.[ValidFromDate] = s.[ValidFromDate])
-- Update attributes of rows which have been modified according to timestamp.
when matched and t.[LastModifiedUtcDateTime] < s.[LastModifiedUtcDateTime] or t.[LastModifiedUtcDateTime] is null then
    update set
        [LineGid] = s.[LineGid],
        [LineNumber] = s.[LineNumber],
        [LineDesignation] = s.[LineDesignation],
        [LineName] = s.[LineName],
        [LineDisplayIndex] = s.[LineDisplayIndex],
        [LineDisplayName] = s.[LineDisplayName],
        [LineIsMonitored] = s.[LineIsMonitored],
        [LastModifiedUtcDateTime] = s.[LastModifiedUtcDateTime]

-- Insert new rows.
when not matched by target then
    insert (
        [RateAreaCombinationKey],
        [ProductGroupKey],
        [DefaultTransportModeKey],
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
        [TransportAuthorityCode],
        [TransportAuthorityName],
        [LineGid],
        [LineNumber],
        [LineDesignation],
        [LineName],
        [LineDisplayIndex],
        [LineDisplayName],
        [LineIsMonitored],
        [ValidFromDate],
        [ValidToDate],
        [LastModifiedUtcDateTime]

)
    values (
        s.[RateAreaCombinationKey],
        s.[ProductGroupKey],
        s.[DefaultTransportModeKey],
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
        s.[TransportAuthorityCode],
        s.[TransportAuthorityName],
        s.[LineGid],
        s.[LineNumber],
        s.[LineDesignation],
        s.[LineName],
        s.[LineDisplayIndex],
        s.[LineDisplayName],
        s.[LineIsMonitored],
        s.[ValidFromDate],
        s.[ValidToDate],
        s.[LastModifiedUtcDateTime]

   
    )
when not matched by source and t.[SourceSystemCode] = @SourceSystemCode then
    update set
        [ValidFromDateKey] = -1,
        [ValidToDateKey] = -1,
        [IsCurrent] = 0;

merge [dim].[Line] as t
using [stg_dim].[Line] as s
on (t.[SourceSystemCode] = s.[SourceSystemCode] and t.[SourceSystemEntryId] = s.[SourceSystemEntryId] and t.[ValidFromDate] = s.[ValidFromDate])
-- Update attributes of rows which have not been modified according to timestamp, but always should be updated.
-- NCP 2016-07-13: Due to the source system clock the timestamps might not always be precisely equal. Thus we tolerate a minor difference (i.e. 30 min).
when matched and t.[LastModifiedUtcDateTime] is null or (t.[LastModifiedUtcDateTime] < getutcdate() and abs(datediff(minute, s.[LastModifiedUtcDateTime], t.[LastModifiedUtcDateTime])) < 30) then
    update set
        [RateAreaCombinationKey] = s.[RateAreaCombinationKey],
        [ProductGroupKey] = s.[ProductGroupKey],
        [DefaultTransportModeKey] = s.[DefaultTransportModeKey],
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
        [TransportAuthorityCode] = s.[TransportAuthorityCode],
        [TransportAuthorityName] = s.[TransportAuthorityName],
        [ValidToDate] = s.[ValidToDate],
        [LastModifiedUtcDateTime] = s.[LastModifiedUtcDateTime];

truncate table [stg_dim].[Line];

end

GO

