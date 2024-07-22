


-- Stored Procedure

-- =============================================
-- Author:		Nasim Odeh
-- Create date: 26-10-2018
-- Description:	Returns bus stop times by specific LineId, DirectionId, StopPointId and Datetime.
-- =============================================
CREATE procedure [api].[ESS_GetStopPointTime]
    @LineId numeric(16, 0)
   ,@DirectionId numeric(16, 0)
   ,@StopPointId numeric(16, 0)
   ,@DateTime datetime = null
as
begin
    set nocount on
    ;
    if @DateTime is null
        set @DateTime = cast(datediff(day, 0, getdate()) + 0 as datetime)
        ;
    select
        [ArrivalState] = jp.[ArrivalStateFinal]
       	,[CrossRegularitet] = case
                                 when (jp.[ObservedDepartureDateTime] is not null and datediff(second, jp.[PlannedDepartureDateTime], jp.[ObservedDepartureDateTime]) > 0)
								       and jp.[ObservedArrivalDateTime]<>jp.[ObservedDepartureDateTime]
                                 then datediff(second, jp.[PlannedDepartureDateTime], jp.[ObservedDepartureDateTime])
                                 when (lead(jp.[ObservedDepartureDateTime]) over (partition by j.[LineNumber] ,jpa.[LineDirectionGid] ,jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]) is not null
						      	       and datediff(second, jp.[PlannedDepartureDateTime], lead(jp.[ObservedDepartureDateTime]) over (partition by j.[LineNumber] ,jpa.[LineDirectionGid] ,jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]))>0)
                                 then datediff(second, jp.[PlannedDepartureDateTime], lead(jp.[ObservedDepartureDateTime]) over (partition by j.[LineNumber] ,jpa.[LineDirectionGid] ,jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]))
                                 when (lead(jp.[ObservedDepartureDateTime],2) over (partition by j.[LineNumber] ,jpa.[LineDirectionGid] ,jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]) is not null
				                        and datediff(second, jp.[PlannedDepartureDateTime], lead(jp.[ObservedDepartureDateTime],2) over (partition by j.[LineNumber] ,jpa.[LineDirectionGid] ,jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]))>0)
                                 then datediff(second, jp.[PlannedDepartureDateTime], lead(jp.[ObservedDepartureDateTime],2) over (partition by j.[LineNumber] ,jpa.[LineDirectionGid] ,jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]))
		                           else -1
                              end
       ,[DepartureState] = jp.[DepartureStateFinal]
       ,[Deviation] = null
       ,[DirectionId] = @DirectionId
       ,[GarageCode] = j.[ContractorCode]
       ,[GarageName] = g.[GarageName]
       ,[JourneyKey] = j.[DatedVehicleJourneyGid]
       ,[JourneyState] = null
       ,[LineId] = @LineId
       ,[LineName] = j.[LineDesignation]
       ,[ObservedArrivalDateTime] = jp.[ObservedArrivalDateTime]
       ,[ObservedDepartureDateTime] = jp.[ObservedDepartureDateTime]
       ,[OperatorCode] = j.[ContractorCode]
       ,[OperatorId] = null
       ,[OperatorName] = c.[ContractorName]
       ,[OperatorPhoneNumber] = null
       ,[PlannedArrivalTime] = jp.[PlannedArrivalDateTime]
       ,[PlannedDepartureTime] = jp.[PlannedDepartureDateTime]
       ,[PlannedRegularitet] = datediff(second, jp.[PlannedDepartureDateTime], lead(jp.[PlannedDepartureDateTime]) over(partition by j.[LineNumber],jpa.[LineDirectionGid],jp.[StopPointNumber] order by jp.[PlannedDepartureDateTime]))
       ,[PrimaryDestinationName] = jpa.[JourneyPatternEndStopPointName]
       ,[SecondaryDestinationName] = null
       ,[StopPointId] = @StopPointId
       ,[StopPointTimeId] = null
    from
        [data].[RT_Journey] j (nolock)
        join [data].[RT_JourneyPoint] jp on
            jp.[JourneyRef] = j.[JourneyRef]
        join [dim].[Date] d (nolock) on
            d.[DateTime] = j.[OperatingDayDate]
        join [dim].[JourneyPattern] jpa (nolock) on
            jpa.[JourneyPatternId] = j.[JourneyPatternId]
            and jpa.LineDirectionGid = @DirectionId
            and d.[DateKey] between jpa.[ValidFromDateKey] and jpa.[ValidToDateKey]
        join [dim].[Line] l (nolock) on
            l.[LineGid] = @LineId
            and l.[LineNumber] = j.[LineNumber]
            and d.[DateKey] between l.[ValidFromDateKey] and l.[ValidToDateKey]
        join [dim].[Contractor] c (nolock) on
            c.[ContractorCode] = j.[ContractorCode]
            and d.[DateKey] between c.[ValidFromDateKey] and c.[ValidToDateKey]
        left join [dim].[Garage] g (nolock) on
            g.[GarageCode] = j.[ContractorGarageCode]
            and d.[DateKey] between c.[ValidFromDateKey] and c.[ValidToDateKey]
        left join [dim].[JourneyPatternPoint] s (nolock) on
            s.[StopPointGid] = @StopPointId
            and d.[DateKey] between s.[ValidFromDateKey] and s.[ValidToDateKey]
        join [dim].[JourneyPatternPoint] jpp (nolock) on
            jpp.[JourneyPatternPointGid] = s.[JourneyPatternPointGid]
            and jp.[JourneyPatternPointGid] = jpp.[JourneyPatternPointGid]
            and d.[DateKey] between jpp.[ValidFromDateKey] and jpp.[ValidToDateKey]
   where
    j.[OperatingDayDate] = cast(@DateTime as date)
    and
        (
            j.[PlannedStartDateTime] >= dateadd(hour, -2, @DateTime)
            and j.[PlannedStartDateTime] <= dateadd(hour, 2, @DateTime)
        )
    order by
         jp.[PlannedDepartureDateTime]
    ;
end
;

GO

