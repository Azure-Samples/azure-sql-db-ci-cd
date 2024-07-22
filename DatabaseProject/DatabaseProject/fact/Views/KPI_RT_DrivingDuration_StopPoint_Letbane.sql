



create view [fact].[KPI_RT_DrivingDuration_StopPoint_Letbane]
as
select
    fact.[DateKey]
   ,fact.[OperatingDayTypeKey]
   ,fact.[TimeKey]
   ,fact.[ContractorKey]
   ,ld.ProductGroupDisplayIndex
   ,ld.LineKey
   ,jps.[StopPointSectionDepartingMunicipalityKey] --Use as MunicipalityKey
   ,fact.JourneyPatternKey --Use as LineKey
   ,jps.JourneyPatternSectionKey
   ,jps.JourneyPatternId
   ,fact.OutlierClassificationKey
   ,sum([PlannedStopPointDistanceMeters]) as [PlannedStopPointDistanceMeters]
   ,sum([PlannedStopPointStopSeconds]) as [PlannedStopPointStopSeconds]
   ,sum([PlannedStopPointDurationSeconds]) as [PlannedStopPointDurationSeconds]
   ,sum([ObservedStopPointStopSeconds]) as [ObservedStopPointStopSeconds]
   ,sum([ObservedStopPointDurationSeconds]) as [ObservedStopPointDurationSeconds]
   ,[ObservedSpeedPrHour] = case
                                when (
                                    (sum([ObservedStopPointStopSeconds]) + sum([ObservedStopPointDurationSeconds])) = 0
                                    or (sum([ObservedStopPointStopSeconds]) + sum([ObservedStopPointDurationSeconds])) is null
                                )
                                     and (
                                         (sum([PlannedStopPointStopSeconds]) + sum([PlannedStopPointDurationSeconds])) = 0
                                         or (sum([PlannedStopPointStopSeconds]) + sum([PlannedStopPointDurationSeconds])) is null
                                     )
                                    then 0
                                when (sum([ObservedStopPointStopSeconds]) + sum([ObservedStopPointDurationSeconds])) = 0
                                     or (sum([ObservedStopPointStopSeconds]) + sum([ObservedStopPointDurationSeconds])) is null
                                    then (sum([PlannedStopPointDistanceMeters]) / (sum([PlannedStopPointStopSeconds]) + sum([PlannedStopPointDurationSeconds])) * 3.6)
                                --when (sum([PlannedStopPointStopSeconds]) + sum([PlannedStopPointDurationSeconds])) = 0
                                --     or (sum([PlannedStopPointStopSeconds]) + sum([PlannedStopPointDurationSeconds])) is null
                                --    then (sum([PlannedStopPointDistanceMeters]) / (sum([ObservedStopPointStopSeconds]) + sum([ObservedStopPointDurationSeconds]))) * 3.6
                                else sum([PlannedStopPointDistanceMeters]) / (sum([ObservedStopPointStopSeconds]) + sum([ObservedStopPointDurationSeconds])) * 3.6
                            end
from
    [fact].[RT_DrivingDuration_StopPoint] as fact
    join data.RT_Journey j on
        j.JourneyRef = left(fact.SourceSystemEntryId, 18)
    --inner join data.RT_JourneyPoint jp on
    --    jp.JourneyRef = j.JourneyRef
    inner join [dim].[JourneyPattern] ld on
        (fact.JourneyPatternKey = ld.JourneyPatternKey)
        and (
            j.OperatingDayDate between ld.ValidFromDate and ld.ValidToDate
            or ld.ValidToDate is null
        )
    join dim.Date d on
        (d.DateKey = fact.DateKey)
    left join [dim].[JourneyPatternSection] as jps on
        (
                                                       jps.JourneyPatternSectionKey = fact.JourneyPatternSectionKey
                                                       and fact.DateKey between jps.ValidFromDateKey and jps.ValidToDateKey
                                                   )
where
--    (
--    fact.OutlierClassificationKey = -1
--    or fact.OutlierClassificationKey is null
--)
    --and j.HasInconsistentObservation <> 1
     d.date between dateadd(month, -3, getdate()) and  getdate()
group by
    fact.[DateKey]
   ,fact.[OperatingDayTypeKey]
   ,fact.[TimeKey]
   ,fact.[ContractorKey]
   ,ld.ProductGroupDisplayIndex
   ,ld.LineKey
   ,jps.[StopPointSectionDepartingMunicipalityKey] --Use as MunicipalityKey
   ,fact.JourneyPatternKey --Use as LineKey
   ,jps.JourneyPatternSectionKey
   ,jps.JourneyPatternId
   ,fact.OutlierClassificationKey
;

GO

