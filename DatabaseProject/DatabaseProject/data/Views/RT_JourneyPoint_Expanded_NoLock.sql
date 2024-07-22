





create view [data].[RT_JourneyPoint_Expanded_NoLock]
as(
select
    p.[JourneyRef]
   ,p.[JourneyPointRef]
   ,p.[OperatingDayDate]
   ,j.[OperatingDayType]
   ,p.[LineNumber]
   ,j.[LineDesignation]
   ,j.[JourneyNumber]
   ,c.[ContractorCode]
   ,c.[ContractorName]
   ,j.[PrimaryVehicleNumber]
   ,jp.[LineDirectionCode]
   ,jp.[LineDirectionName]
   ,jp.[JourneyPatternPointCount]
   ,jp.[JourneyPatternStopPointCount]
   ,jp.[JourneyPatternStartStopPointNumber]
   ,jp.[JourneyPatternStartStopPointName]
   ,jp.[JourneyPatternEndStopPointNumber]
   ,jp.[JourneyPatternEndStopPointName]
   ,[PlannedStartTime] = cast(j.[PlannedStartDateTime] as time(0))
   --j.[PlannedStartDateTime],
   ,[PlannedEndTime] = cast(j.[PlannedEndDateTime] as time(0))
   --j.[PlannedEndDateTime],
   ,p.[SequenceNumber]
   ,pijp.[LineDirectionLegacyOrder]
   ,jpp.[MunicipalityCode]
   ,jpp.[MunicipalityDisplayName]
   ,jpp.[JourneyPatternPointNumber]
   ,jpp.[StopPointDisplayName]
   ,jpp.[JourneyPatternPointLatitude]
   ,jpp.[JourneyPatternPointLongitude]
   ,p.[IsStopPoint]
   ,p.[IsTimingPoint]
   ,[IsFirstStopPoint] = cast(case when p.[SequenceNumber] = 1 then 1 else 0 end as bit)
   ,[IsLastStopPoint] = cast(case
                                 when p.[SequenceNumber] = jp.[JourneyPatternPointCount] then 1
                                 else 0
                             end as bit)
   ,[IsPassing] = cast(case
                           when p.[ObservedArrivalDateTime] = p.[ObservedDepartureDateTime] then 1
                           else 0
                       end as bit)
   ,[IsObserved] = cast(case
                            when p.[ObservedArrivalDateTime] is not null
                                 or p.[ObservedDepartureDateTime] is not null then 1
                            else 0
                        end as bit)
   ,[PlannedArrivalTime] = cast(p.[PlannedArrivalDateTime] as time(0))
   ,[PlannedDepartureTime] = cast(p.[PlannedDepartureDateTime] as time(0))
   ,[ObservedArrivalTime] = cast(p.[ObservedArrivalDateTime] as time(0))
   ,[ObservedDepartureTime] = cast(p.[ObservedDepartureDateTime] as time(0))
   ,[ObservedStopSeconds] = datediff(second, p.[ObservedArrivalDateTime], p.[ObservedDepartureDateTime])
   ,p.[TotalCheckInCount]
   ,p.[TotalCashTicketCount]
from
    [data].[RT_Journey] j (nolock)
    join [data].[RT_JourneyPoint] p (nolock) on
        p.[JourneyRef] = j.[JourneyRef]
    join [data].[RT_DOI_PointInJourneyPattern] pijp (nolock) on
        pijp.[JourneyPatternId] = j.[JourneyPatternId]
        and pijp.[SequenceNumber] = p.[SequenceNumber]
    join [dim].[Date] d (nolock) on
        d.[Date] = j.[OperatingDayDate]
    join [dim].[JourneyPattern] jp (nolock) on
        jp.[JourneyPatternId] = j.[JourneyPatternId]
        and d.[DateKey] between jp.[ValidFromDateKey] and jp.[ValidToDateKey]
    join [dim].[JourneyPatternPoint] jpp (nolock) on
        jpp.[JourneyPatternPointGid] = p.[JourneyPatternPointGid]
        and d.[DateKey] between jpp.[ValidFromDateKey] and jpp.[ValidToDateKey]
    join [dim].[Contractor] c (nolock) on
        c.[ContractorCode] = j.[ContractorCode]
        and d.[DateKey] between c.[ValidFromDateKey] and c.[ValidToDateKey]);

GO

