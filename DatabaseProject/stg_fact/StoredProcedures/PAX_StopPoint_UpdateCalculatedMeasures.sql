

-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2022-02-15
-- Description: Updates calculated attributes stg_fact.PAX_StopPoint
-- =============================================
CREATE procedure [stg_fact].[PAX_StopPoint_UpdateCalculatedMeasures]
as
begin

    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    /* Step 1: Update PlannedDistanceMetersAvg based on GIS data */
    with
    [LagStopPointId] as
    (
        select
            [DateKey]
           ,[TypeOfDay]
           ,[JourneyPatternId]
           ,[JourneyStartTime]
           ,[SequenceNumber]
           ,[PlannedDistanceMetersAvg]
           ,StopPointId = sp.[StopPointId]
           ,LagStopPointId = lag([StopPointId]) over (partition by
                                                          [DateKey]
                                                         ,[TypeOfDay]
                                                         ,[JourneyPatternId]
                                                         ,[JourneyStartTime]
                                                      order by
                                                          [SequenceNumber]
                                                )
        from
            [stg_fact].[PAX_StopPoint] pax
            join dim.[StopPoint] sp on
                sp.[StopPointKey] = pax.[StopPointKey]
    )
    update
        s
    set
        [PlannedDistanceMetersAvg] = iif(s.[SequenceNumber] = 1, 0.0, rl.[Length])
    from
        [LagStopPointId] s
        left join [data].[GIS_RouteLink_StopPoint] rl on
            rl.[FromStopPointId] = s.[LagStopPointId]
            and rl.[ToStopPointId] = s.[StopPointId]
            and cast(cast(s.[DateKey] as nvarchar(8)) as date) between rl.[ValidFromDate] and isnull(rl.[ValidToDate], '9999-12-31');

    /* Step 2: Update CalculatedOccupancyAvg based on PAX_Journey data and weights */
    with
    [CalculatedOccupancy] as
    (
        select
            sp.OccupancyAvg
           ,[CalculatedOccupancyAvg] = cast((sum(sp.[BoardersWeightAvg] * j.[BoardersAvg]) over (partition by
                                                                                                     sp.[SourceSystemCode]
                                                                                                    ,sp.[DateKey]
                                                                                                    ,sp.[TypeOfDay]
                                                                                                    ,sp.[JourneyStartTime]
                                                                                                    ,sp.[JourneyPatternId]
                                                                                                 order by
                                                                                                     sp.[SequenceNumber]
                                                                                                 rows between unbounded preceding and current row
                                                                                           )
                                             - sum(sp.[AlightersWeightAvg] * j.[AlightersAvg]) over (partition by
                                                                                                         sp.[SourceSystemCode]
                                                                                                        ,sp.[DateKey]
                                                                                                        ,sp.[TypeOfDay]
                                                                                                        ,sp.[JourneyStartTime]
                                                                                                        ,sp.[JourneyPatternId]
                                                                                                     order by
                                                                                                         sp.[SequenceNumber]
                                                                                                     rows between unbounded preceding and current row
                                                                                               )
                                            ) as decimal(12, 7))
        from
            [stg_fact].[PAX_StopPoint] sp
            inner join [fact].[PAX_Journey] j on
                sp.[SourceSystemKey] = j.[SourceSystemKey]
                and sp.[DateKey] = j.[DateKey]
                and sp.[OperatingDayTypeKey] = j.[OperatingDayTypeKey]
                and sp.[TimeKey] = j.[TimeKey]
                and sp.[JourneyPatternId] = j.[JourneyPatternId]
    )
    update
        [CalculatedOccupancy]
    set
        [OccupancyAvg] = [CalculatedOccupancyAvg];
        
end;

GO

