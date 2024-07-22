CREATE proc [stg].[RK_PaxModel_Stage] (@FromOperatingDayDate date, @ToOperatingDayDate date)
as
begin

    truncate table [stg].[RK_PaxModel_Daily];

    with
    [JourneyStats] as
    (
        select
            [pot].[JourneyRef]
           ,[pot].[VehicleID]
           ,[TotalPassengerCount] = count(1)
           ,[BoardersAtPointCount] = count([pot].[FromJourneyPointRef])
           ,[AligthersAtPointCount] = count([pot].[ToJourneyPointRef])
        from
            [data].[RK_PartOfTrip_Daily] [pot]
        where
            [pot].[TransactionType] = 30
            and [pot].[ServiceProviderID] = 2006
            and [pot].[TripType] like 'Fi%Co'
            and [pot].[JourneyRef] is not null
            and [pot].[VehicleID] is not null
            and [pot].[TripDate] between dateadd(day, -1, @FromOperatingDayDate) and dateadd(
                                                                                         day, 1, @ToOperatingDayDate
                                                                                     )
        group by
            [pot].[JourneyRef]
           ,[pot].[VehicleID]
    )
   ,
    [FromJourneyPointAgg] as
    (
        select
            [pot].[VehicleID]
           ,[pot].[FromJourneyPointRef]
           ,[BoardingCount] = count(1)
        from
            [data].[RK_PartOfTrip_Daily] [pot]
            join [JourneyStats] [sel] on
                [sel].[JourneyRef] = [pot].[JourneyRef]
                and [sel].[VehicleID] = [pot].[VehicleID]
        where
            [pot].[TransactionType] = 30
            and [pot].[ServiceProviderID] = 2006
            and [pot].[TripType] like 'Fi%Co'
            and [pot].[FromJourneyPointRef] is not null
        group by
            [pot].[VehicleID]
           ,[pot].[FromJourneyPointRef]
    )
   ,
    [ToJourneyPointAgg] as
    (
        select
            [pot].[VehicleID]
           ,[pot].[ToJourneyPointRef]
           ,[AlightingCount] = count(1)
        from
            [data].[RK_PartOfTrip_Daily] [pot]
            join [JourneyStats] [sel] on
                [sel].[JourneyRef] = [pot].[JourneyRef]
                and [sel].[VehicleID] = [pot].[VehicleID]
        where
            [pot].[TransactionType] = 30
            and [pot].[ServiceProviderID] = 2006
            and [pot].[TripType] like 'Fi%Co'
            and [pot].[ToJourneyPointRef] is not null
        group by
            [pot].[VehicleID]
           ,[pot].[ToJourneyPointRef]
    )
    insert into
        [stg].[RK_PaxModel_Daily]
    (
        [JourneyRef]
       ,[JourneyPointRef]
       ,[OperatingDayDate]
       ,[VehicleId]
       ,[ObservedVehicleId]
       ,[IsPrimaryVehicle]
       ,[PlannedDepartureDateTime]
       ,[JourneyTotalCount]
       ,[JourneyBalance]
       ,[BoardingCount]
       ,[AlightingCount]
       ,[InVehicleCount]
    )
    select
        [p].[JourneyRef]
       ,[p].[JourneyPointRef]
       ,[p].[OperatingDayDate]
       ,[sel].[VehicleID]
       ,[p].[ObservedVehicleId]
       ,iif([j].[PrimaryVehicleNumber] = [sel].[VehicleID], 1, 0)
       ,[p].[PlannedDepartureDateTime]
       ,[JourneyTotalCount] = [sel].[TotalPassengerCount]
       ,[JourneyBalance] = 1.0 * ([sel].[BoardersAtPointCount] - [sel].[AligthersAtPointCount])
                           / [sel].[TotalPassengerCount]
       ,[BoardingCount] = isnull([b].[BoardingCount], 0)
       ,[AlightingCount] = isnull([a].[AlightingCount], 0)
       ,[InVehicleCount] = sum(isnull([b].[BoardingCount], 0)) over (partition by
                                                                         [p].[JourneyRef]
                                                                        ,[sel].[VehicleID]
                                                                     order by
                                                                         [p].[JourneyPointRef]
                                                                     rows between unbounded preceding and current row
                                                               )
                           - sum(isnull([a].[AlightingCount], 0)) over (partition by
                                                                            [p].[JourneyRef]
                                                                           ,[sel].[VehicleID]
                                                                        order by
                                                                            [p].[JourneyPointRef]
                                                                        rows between unbounded preceding and current row
                                                                  )
    from
        [data].[RT_JourneyPoint] [p]
        join [data].[RT_Journey] [j] on
            [j].[JourneyRef] = [p].[JourneyRef]
        join [JourneyStats] [sel] on
            [sel].[JourneyRef] = [p].[JourneyRef]
        left join [FromJourneyPointAgg] [b] on
            [b].[FromJourneyPointRef] = [p].[JourneyPointRef]
            and [b].[VehicleID] = [sel].[VehicleID]
        left join [ToJourneyPointAgg] [a] on
            [a].[ToJourneyPointRef] = [p].[JourneyPointRef]
            and [a].[VehicleID] = [sel].[VehicleID]
    where
        [p].[OperatingDayDate] between @FromOperatingDayDate and @ToOperatingDayDate
        and [j].[OperatingDayDate] between @FromOperatingDayDate and @ToOperatingDayDate;

end;

GO

