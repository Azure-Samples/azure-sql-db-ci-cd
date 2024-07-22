






-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-09-02
-- Description: Updates RT_VehicleJourneyAssignment for PT based on ROI (RT_ROI_VehicleJourneyAssignment). This also re-calculates the Expanded Assignment Window for the given span of Operating Day Dates.
--
-- If @useStagingVehicleJourneyAssignment is set to 1 it will use the staging version of RT_ROI_VehicleJourneyAssignment and is intended for fast incremental updates. This only makes sence if the staging version contains Vehicle-Journey-assignments between @fromOperatingDayDate and @toOperatingDayDate.
-- Otherwise it will use the data version (default)
-- 
-- If @updateJourney = 1 the 
--
-- =============================================
CREATE procedure [data].[RT_VehicleJourneyAssignment_UpsertFromRoi]
(
    @fromOperatingDayDate date
   ,@toOperatingDayDate date
   ,@useStagingVehicleJourneyAssignment bit = 0
   ,@updateJourney bit = 1
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    truncate table [stg].[RT_VehicleJourneyAssignment];

    if @useStagingVehicleJourneyAssignment = 0
    begin
        insert into
            [stg].[RT_VehicleJourneyAssignment]
        (
            [SourceSystemCode]
           ,[SourceSystemEntryRef]
           ,[JourneyRef]
           ,[OperatingDayDate]
           ,[AssignmentType]
           ,[AssignedFromDateTime]
           ,[AssignedToDateTime]
           ,[VehicleNumber]
           ,[VehicleGid]
        )
        select
            [SourceSystemCode] = 'PT'
           ,[SourceSystemEntryRef] = [vja].[Id]
           ,[j].[JourneyRef]
           ,[vja].[OperatingDayDate]
           ,[AssignmentType] = 0
           ,[AssignedFromDateTime] = [vja].[ValidFromDateTime]
           ,[AssignedToDateTime] = [vja].[InvalidFromDateTime]
           ,[VehicleNumber] = [vja].[IsToVehicleGid] % 100000
           ,[VehicleGid] = [vja].[IsToVehicleGid]
        from
            [data].[RT_ROI_VehicleJourneyAssignment] vja
            join [data].[RT_Journey] j on
                j.[OperatingDayDate] = vja.[OperatingDayDate]
                and j.[DatedVehicleJourneyId] = vja.[IsOfDatedVehicleJourneyId]
        where
            vja.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
            and [vja].[State] = 1 
    end;
    else
    begin
        insert into
            [stg].[RT_VehicleJourneyAssignment]
        (
            [SourceSystemCode]
           ,[SourceSystemEntryRef]
           ,[JourneyRef]
           ,[OperatingDayDate]
           ,[AssignmentType]
           ,[AssignedFromDateTime]
           ,[AssignedToDateTime]
           ,[VehicleNumber]
           ,[VehicleGid]
        )
        select
            [SourceSystemCode] = 'PT'
           ,[SourceSystemEntryRef] = [vja].[Id]
           ,[j].[JourneyRef]
           ,[vja].[OperatingDayDate]
           ,[AssignmentType] = 0
           ,[AssignedFromDateTime] = [vja].[ValidFromDateTime]
           ,[AssignedToDateTime] = [vja].[InvalidFromDateTime]
           ,[VehicleNumber] = [vja].[IsToVehicleGid] % 100000
           ,[VehicleGid] = [vja].[IsToVehicleGid]
        from
            [stg].[RT_ROI_VehicleJourneyAssignment] vja
            join [data].[RT_Journey] j on
                j.[OperatingDayDate] = vja.[OperatingDayDate]
                and j.[DatedVehicleJourneyId] = vja.[IsOfDatedVehicleJourneyId]
        where
            vja.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
            and [vja].[State] = 1 
    end;

    exec [integration].[AutoMerge]
        @Source = N'stg.RT_VehicleJourneyAssignment'
       ,@Target = N'data.RT_VehicleJourneyAssignment'
       ,@Mode = 1
       ,@SkipMissingSourceColumns = 1
       ,@Debug = 0;

    
    with
        [Window] as
        (
            select
                [OperatingDayDate]
               ,[AssignedFromDateTime]
               ,[AssignedToDateTime]
               ,[AssignedFromDateTimeExpanded]
               ,[AssignedToDateTimeExpanded]
               ,[AssignedToDateTimeLag] = lag([AssignedToDateTime]) over (partition by
                                                                              [VehicleNumber]
                                                                          order by
                                                                              [AssignedFromDateTime]
                                                                    )
               ,[AssignedFromDateTimeLead] = lead([AssignedFromDateTime]) over (partition by
                                                                                    [VehicleNumber]
                                                                                order by
                                                                                    [AssignedFromDateTime]
                                                                          )
            from
                [data].[RT_VehicleJourneyAssignment]
            where
                [SourceSystemCode] = 'PT'
                and [OperatingDayDate] between dateadd(day, -1, @fromOperatingDayDate) and dateadd(day, 1, @toOperatingDayDate)
        )
    update
        [Window]
    set
        [Window].[AssignedFromDateTimeExpanded] = case
                                                      when datediff(minute, [Window].[AssignedToDateTimeLag], [Window].[AssignedFromDateTime]) <= 30
                                                          then [Window].[AssignedToDateTimeLag]
                                                      else dateadd(minute, -30, [Window].[AssignedFromDateTime])
                                                  end
       ,[Window].[AssignedToDateTimeExpanded] = case
                                                    when datediff(minute, [Window].[AssignedToDateTime], [Window].[AssignedFromDateTimeLead]) <= 30
                                                        then [Window].[AssignedFromDateTimeLead]
                                                    else dateadd(minute, 30, [Window].[AssignedToDateTime])
                                                end
    where
        [Window].[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
    ;

    truncate table [stg].[RT_VehicleJourneyAssignment];

    -- Cascade update to RT_Journey
    if @updateJourney = 1 begin
        exec [data].[RT_Journey_UpdateVehicleJourneyAssignment]
            @fromOperatingDayDate = @fromOperatingDayDate
           ,@toOperatingDayDate = @toOperatingDayDate
    end

end;

GO

