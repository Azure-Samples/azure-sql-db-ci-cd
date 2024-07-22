
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-09-02
-- Description: Updates OutlierClassification field in data.RT_JourneyPoint.
-- =============================================
create procedure [data].[RT_JourneyPoint_UpdateOutlierClassification] (@fromOperatingDayDate date, @toOperatingDayDate date)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Insert statements for procedure here
    with
    [RT_OutliersClassification] as
    (
        select
            [p].[JourneyPointRef]
           /* Rule 1: DiffObservedVsPlannedDrivingTime180SecondsOrMore */
           ,[DiffObservedVsPlannedDrivingTime180SecondsOrMore] = case
                                                                     when abs(datediff(
                                                                                  second
                                                                                 ,lag([p].[PlannedDepartureDateTime]) over (partition by p.[JourneyRef] order by [p].[JourneyPointRef])
                                                                                 ,[p].[PlannedArrivalDateTime]
                                                                              )
                                                                              - datediff(
                                                                                    second
                                                                                   ,lag([p].[ObservedDepartureDateTime]) over (partition by p.[JourneyRef] order by [p].[JourneyPointRef])
                                                                                   ,[p].[ObservedArrivalDateTime]
                                                                                )
                                                                          ) >= 180 then 1
                                                                     else 0
                                                                 end
           /* Rule 2: DwellTime3MinOrMoreTimingPoint */
           ,[DwellTime3MinOrMoreTimingPoint] = case
                                                   when p.[IsTimingPoint] = 1
                                                        and [pitjp].[IsFirstPoint] = 0
                                                        and [pitjp].[IsLastPoint] = 0
                                                        and datediff(
                                                                second
                                                                ,[p].[ObservedArrivalDateTime]
                                                                ,[p].[ObservedDepartureDateTime]
                                                            ) - [pitjp].[DwellTimeSeconds] > 180 then 1
                                                   else 0
                                               end
           /* Rule 3: DwellTime2MinOrMoreNotTimingPoint */
           ,[DwellTime2MinOrMoreNotTimingPoint] = case
                                                      when p.[IsTimingPoint] = 0
                                                           and [pitjp].[IsFirstPoint] = 0
                                                           and [pitjp].[IsLastPoint] = 0
                                                           and datediff(
                                                                   second
                                                                   ,[p].[ObservedArrivalDateTime]
                                                                   ,[p].[ObservedDepartureDateTime]
                                                               ) - [pitjp].[DwellTimeSeconds] > 120 then 1
                                                      else 0
                                                  end
        from
            [data].[RT_JourneyPoint] p
            join [data].[RT_Journey] j on
                j.[JourneyRef] = p.[JourneyRef]
            join [data].[RT_DOI_PointInTimedJourneyPattern] pitjp on
                pitjp.[TimedJourneyPatternId] = j.[TimedJourneyPatternId]
                and pitjp.[SequenceNumber] = p.[SequenceNumber]
        where
            p.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
            and p.[IsStopPoint] = 1
    )
    update
        p
    set
        p.[OutlierClassification] = isnull(
                                        oc.[DwellTime2MinOrMoreNotTimingPoint] * 4
                                        + oc.[DwellTime3MinOrMoreTimingPoint] * 2
                                        + oc.[DiffObservedVsPlannedDrivingTime180SecondsOrMore]
                                       ,0
                                    )
    from
        [data].[RT_JourneyPoint] p
        left join [RT_OutliersClassification] oc on
            oc.[JourneyPointRef] = p.[JourneyPointRef]
    where
        p.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate;
end;

GO

