




-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-09-02
-- Description: Updates ObservedVehicleId field in data.RT_JourneyPoint based on ROI (RT_ROI_VehicleJourneyAssignment).
--
-- If @useStagingVehicleJourneyAssignment is set to 1 it will use the staging version of RT_ROI_VehicleJourneyAssignment and is intended for fast incremental updates. This only makes sence if the staging version contains Vehicle-Journey-assignments between @fromOperatingDayDate and @toOperatingDayDate.
-- Otherwise it will use the data version (default)
-- =============================================
CREATE procedure [data].[RT_JourneyPoint_UpdateObservedVehicleId]
(
    @fromOperatingDayDate date
   ,@toOperatingDayDate date
   ,@useStagingVehicleJourneyAssignment bit = 0
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare @operatingDayDate date = @fromOperatingDayDate;

    if @useStagingVehicleJourneyAssignment = 0
    begin
        while @operatingDayDate <= @toOperatingDayDate
        begin
            update
                p
            set
                [ObservedVehicleId] = vja.IsToVehicleGid % 100000
            from
                [data].[RT_JourneyPoint] p
                join [data].[RT_Journey] j on
                    j.[JourneyRef] = p.[JourneyRef]
                -- TODO: Whoud be nice to use utc times here
                join [data].[RT_ROI_VehicleJourneyAssignment] vja on
                    vja.[OperatingDayDate] = j.[OperatingDayDate]
                    and vja.[IsOfDatedVehicleJourneyId] = j.[DatedVehicleJourneyId]
                    and cast(vja.[ValidFromDateTime] as datetime2(0)) <= iif(p.[ArrivalType] < 2
                                                                            ,p.[ObservedDepartureDateTime]
                                                                            ,isnull(
                                                                                 p.[ObservedArrivalDateTime]
                                                                                 ,p.[ObservedDepartureDateTime]
                                                                             ))
                    and iif(p.[DepartureType] < 2
                           ,p.[ObservedArrivalDateTime]
                           ,isnull(p.[ObservedDepartureDateTime], p.[ObservedArrivalDateTime])) <= vja.[InvalidFromDateTime]
                    and vja.[State] = 1
            where
                p.[OperatingDayDate] = @operatingDayDate
                and j.[OperatingDayDate] = @operatingDayDate;

            set @operatingDayDate = dateadd(day, 1, @operatingDayDate);
        end;
    end;
    else
    begin
        while @operatingDayDate <= @toOperatingDayDate
        begin
            update
                p
            set
                [ObservedVehicleId] = vja.IsToVehicleGid % 100000
            from
                [data].[RT_JourneyPoint] p
                join [data].[RT_Journey] j on
                    j.[JourneyRef] = p.[JourneyRef]
                -- TODO: Whoud be nice to use utc times here
                join [stg].[RT_ROI_VehicleJourneyAssignment] vja on
                    vja.[OperatingDayDate] = j.[OperatingDayDate]
                    and vja.[IsOfDatedVehicleJourneyId] = j.[DatedVehicleJourneyId]
                    and cast(vja.[ValidFromDateTime] as datetime2(0)) <= iif(p.[ArrivalType] < 2
                                                                            ,p.[ObservedDepartureDateTime]
                                                                            ,isnull(
                                                                                 p.[ObservedArrivalDateTime]
                                                                                 ,p.[ObservedDepartureDateTime]
                                                                             ))
                    and iif(p.[DepartureType] < 2
                           ,p.[ObservedArrivalDateTime]
                           ,isnull(p.[ObservedDepartureDateTime], p.[ObservedArrivalDateTime])) <= vja.[InvalidFromDateTime]
                    and vja.[State] = 1
            where
                p.[OperatingDayDate] = @operatingDayDate
                and j.[OperatingDayDate] = @operatingDayDate;

            set @operatingDayDate = dateadd(day, 1, @operatingDayDate);
        end;
    end;
end;

GO

