

create view [fact].[KPI_RT_DrivingReliability_TimingPoint]
as
with
    [DrivingReliability] as
    (
        select
            dr.[DrivingReliabilityTimingPointKey]
           ,dr.[DateKey]
           ,dr.[TimeKey]
           ,dr.[JourneyPlannedStartTimeKey]
           ,dr.[OperatingDayTypeKey]
           ,dr.[ContractorKey]
           ,dr.[ContractorGarageKey]
           ,dr.[JourneyPatternKey]
           ,dr.[JourneyPatternSectionKey]
           ,dr.[StopPointKey]
           ,dr.[ReliabilityTypeKey]
           ,dr.[ContractKey]
           ,jp.[LineKey]
           ,dr.[SourceSystemCode]
           ,dr.[SourceSystemEntryId]
           ,dr.[PlannedStopSeconds]
           ,dr.[ObservedStopSeconds]
           ,dr.[PlannedFrequencySeconds]
           ,dr.[ObservedFrequencySeconds]
           ,dr.[TimetableOffsetSeconds]
           ,dr.[FrequencyOffsetSeconds]
           ,dr.[IsReliable]
           ,dr.[OutlierClassificationKey]
           ,dr.[IsFirstStopPoint]
           ,dr.[IsLastStopPoint]
           ,dr.[IsRingLine]
           ,dr.[StrategicNetKey]
           ,t.[Hour]
           ,jp.[LineDesignation]
           ,case
                when (dr.[IsReliable] is not null)
                    then 1
                else null
            end as [ObservationPoint]
           ,case
                when dr.[ObservedFrequencySeconds] <= 60
                    then 1
                else null
            end as [Congestion]
        from
            [fact].[RT_DrivingReliability_TimingPoint] dr (nolock)
            join [dim].[Time] t (nolock) on
                t.TimeKey = dr.TimeKey
            join [dim].[JourneyPattern] jp (nolock) on
                jp.JourneyPatternKey = dr.JourneyPatternKey
    )
select
    [LineKey]
   ,[OperatingDayTypeKey]
   ,[ContractorKey]
   ,[ContractKey]
   ,[DateKey]
   ,[TimeKey]
   ,[StrategicNetKey]
   ,[JourneyPatternKey]
   ,[JourneyPatternSectionKey]
   ,[Hour]
   ,[LineDesignation] as Linje
   ,[Congestion] = iif(sum([Congestion]) is null, 0, sum([Congestion]))
   ,[ReliabilityCount] = sum(isnull([IsReliable], 0))
   ,[ObservationPointCount] = iif(sum([ObservationPoint]) is null, 0, sum([ObservationPoint]))
from
    [DrivingReliability]
group by
    [LineKey]
   ,[Hour]
   ,[OperatingDayTypeKey]
   ,[ContractorKey]
   ,[ContractKey]
   ,[DateKey]
   ,[TimeKey]
   ,[LineDesignation]
   ,[StrategicNetKey]
   ,[JourneyPatternKey]
   ,[JourneyPatternSectionKey]
;

GO

