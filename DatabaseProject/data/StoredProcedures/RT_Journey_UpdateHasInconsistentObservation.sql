
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-09-02
-- Description: Updates HasInconsistentObservation on RT_Journey by rolling up arrival/departures timestamps RT_JourneyPoint.
-- 2023-10-30 LSI: Added [Updated] =  sysdatetime()
-- =============================================
CREATE procedure [data].[RT_Journey_UpdateHasInconsistentObservation]
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

    -- Insert statements for procedure here
    with
    [_InconsistentObservation] as
    (
        select
            p.[JourneyRef]
           ,[InconsistentObservation] = case
                when [ObservedDepartureDateTime] > min(p.[ObservedArrivalDateTime]) over (partition by
                                                                                                p.[JourneyRef]
                                                                                            order by
                                                                                                p.[JourneyPointRef]
                                                                                            rows between 1 following and unbounded following
                                                                                    ) then 1
                when [ObservedArrivalDateTime] < max(p.[ObservedDepartureDateTime]) over (partition by
                                                                                                p.[JourneyRef]
                                                                                            order by
                                                                                                p.[JourneyPointRef]
                                                                                            rows between unbounded preceding and 1 preceding
                                                                                    ) then 1
                when p.[ObservedDepartureDateTime] < p.[ObservedArrivalDateTime] then 1
                else 0
            end
        from
            [data].[RT_JourneyPoint] p
        where
            p.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
    )
   ,
    [_InconsistentJourney] as
    (
        select
            [JourneyRef]
           ,[HasInconsistentObservation] = iif(sum([InconsistentObservation]) > 0, 1, 0)
        from
            [_InconsistentObservation]
        group by
            [JourneyRef]
    )
    update
        j
    set
        [HasInconsistentObservation] = _j.[HasInconsistentObservation]
	   ,[Updated] =  sysdatetime()
    from
        [data].[RT_Journey] j
        join [_InconsistentJourney] _j on
            _j.[JourneyRef] = j.[JourneyRef];
end;

GO

