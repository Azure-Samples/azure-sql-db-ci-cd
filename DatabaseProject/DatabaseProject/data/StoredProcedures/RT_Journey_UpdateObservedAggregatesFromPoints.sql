
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-09-02
-- Description: Updates RT_Journey with:
--              Observed Start and End Date/Time from first/last Stop in RT_JourneyPoint.
--              Observed/Expected/Estimated Arrival and Departure Count by aggregating RT_JourneyPoint.
--2023-10-30 LSI: Added [Updated] =  sysdatetime()
-- =============================================
CREATE procedure [data].[RT_Journey_UpdateObservedAggregatesFromPoints]
(
    -- Add the parameters for the stored procedure here
    @fromOperatingDayDate date
   ,@toOperatingDayDate date
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    /* Performance: Queying date intervals on RT_JourneyPoint is slow compared to querying specific dates which can utilize hash indexes.
     *              Therefore we simply iterate over the dates in the interval one by one. There will usually only be one or two. */

    declare @operatingDayDate date = @fromOperatingDayDate;

    while @operatingDayDate <= @toOperatingDayDate
    begin
        print 'Processing OperatingDayDate = ' + convert(nvarchar(50), @operatingDayDate);

        -- Updates Observed Start and End Date on Journey
        update
            j
        set
            [ObservedStartDateTime] = p1.[ObservedDepartureDateTime]
           ,[ObservedEndDateTime] = p2.[ObservedArrivalDateTime]
		   ,[Updated] =  sysdatetime()
        from
            [data].[RT_Journey] j
            join [dim].[JourneyPattern] jp (nolock) on
                jp.[JourneyPatternId] = j.[JourneyPatternId]
                and jp.[IsCurrent] = 1
            left join [data].[RT_JourneyPoint] p1 (nolock) on
                p1.[JourneyRef] = j.[JourneyRef]
                and p1.[SequenceNumber] = 1
            left join [data].[RT_JourneyPoint] p2 (nolock) on
                p2.[JourneyRef] = j.[JourneyRef]
                and p2.[SequenceNumber] = jp.[JourneyPatternPointCount]
        where
            j.[OperatingDayDate] = @operatingDayDate;


        -- Updates Journey Points Aggregates
        with
        [JourneyPointAgg] as
        (
            select
                j.[JourneyRef]

               -- Exclude DepartureType NO_STOP (0) and NO_BOARDING (1)
               -- Exclude DepartureState NOTEXPECTED (0) and CANCELLED (3)
               ,[ExpectedDepartureCount] = count(case
                                                     when p.[DepartureType] > 1
                                                          and p.[DepartureStateFinal] not in ( 0, 3 ) then 1
                                                 end
                                           )
               ,[EstimatedDepartureCount] = count(
                                                case
                                                    when p.[DepartureType] > 1
                                                         and p.[DepartureStateFinal] not in ( 0, 3 ) then
                                                        p.[EstimatedDepartureDateTimeFinal]
                                                end
                                            )
               ,[ObservedDepartureCount] = count(
                                               case
                                                   when p.[DepartureType] > 1
                                                        and p.[DepartureStateFinal] not in ( 0, 3 ) then
                                                       p.[ObservedDepartureDateTime]
                                               end
                                           )
               -- Exclude DepartureType NO_STOP (0) and NO_BOARDING (1)
               -- Exclude DepartureState NOTEXPECTED (0) and CANCELLED (3)
               ,[ExpectedArrivalCount] = count(case
                                                   when p.[ArrivalType] > 1
                                                        and p.[ArrivalStateFinal] not in ( 0, 3 ) then 1
                                               end
                                         )
               ,[ObservedArrivalCount] = count(
                                               case
                                                   when p.[ArrivalType] > 1
                                                        and p.[ArrivalStateFinal] not in ( 0, 3 ) then
                                                       p.[ObservedArrivalDateTime]
                                               end
                                           )
            from
                [data].[RT_Journey] j
                join [data].[RT_JourneyPoint] p (nolock) on
                    p.[JourneyRef] = j.[JourneyRef]
            where
                j.[OperatingDayDate] = @operatingDayDate
            group by
                j.[JourneyRef]
        )
        update
            j
        set
            [ExpectedDepartureCount] = agg.[ExpectedDepartureCount]
           ,[EstimatedDepartureCount] = agg.[EstimatedDepartureCount]
           ,[ObservedDepartureCount] = agg.[ObservedDepartureCount]
           ,[ExpectedArrivalCount] = agg.[ExpectedDepartureCount]
           ,[ObservedArrivalCount] = agg.[ObservedArrivalCount]
		   ,[Updated] =  sysdatetime()
        from
            [data].[RT_Journey] j
            join [JourneyPointAgg] agg on
                agg.[JourneyRef] = j.[JourneyRef]
        where
            j.[OperatingDayDate] = @operatingDayDate;

        set @operatingDayDate = dateadd(d, 1, @operatingDayDate);
    end;

end;

GO

