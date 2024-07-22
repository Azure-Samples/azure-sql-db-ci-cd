
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-06-18
-- Description: Merge for RT_Journey - Updates planned data columns.
-- 2023-10-30 LSI: Added [Inserted] and [Updated] =  sysdatetime()
-- =============================================
CREATE procedure [integration].[RT_Journey_MergePlannedData]
(
    @SourceSystemCode nvarchar(20)
   ,@FromOperatingDayDate date
   ,@ToOperatingDayDate date
   ,@TruncateStagingAfter bit = 0
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    merge [data].[RT_Journey] as t
    using [stg].[RT_Journey] as s
    on (t.[JourneyRef] = s.[JourneyRef])
    when matched then update set
                          [SourceSystemCode] = s.[SourceSystemCode]
                         ,[SourceSystemEntryRef] = s.[SourceSystemEntryRef]
                         ,[OperatingDayDate] = s.[OperatingDayDate]
                         ,[OperatingDayType] = s.[OperatingDayType]
                         ,[DatedVehicleJourneyId] = s.[DatedVehicleJourneyId]
                         ,[DatedVehicleJourneyGid] = s.[DatedVehicleJourneyGid]
                         ,[JourneyNumber] = s.[JourneyNumber]
                         ,[JourneyPatternId] = s.[JourneyPatternId]
                         ,[TimedJourneyPatternId] = s.[TimedJourneyPatternId]
                         ,[LineNumber] = s.[LineNumber]
                         ,[LineDesignation] = s.[LineDesignation]
                         ,[LineDirectionCode] = s.[LineDirectionCode]
                         ,[TransportModeCode] = s.[TransportModeCode]
                         ,[ContractCode] = s.[ContractCode]
                         ,[ContractorCode] = s.[ContractorCode]
                         ,[ContractorGarageCode] = s.[ContractorGarageCode]
                         ,[PlannedStartDateTime] = s.[PlannedStartDateTime]
                         ,[PlannedEndDateTime] = s.[PlannedEndDateTime]
                         ,[PlannedStopCount] = s.[PlannedStopCount]
                         ,[PlannedPaidDurationSeconds] = s.[PlannedPaidDurationSeconds]
                         ,[PlannedPaidDistanceMeters] = s.[PlannedPaidDistanceMeters]
                         ,[IsReplaced] = 0
						 ,[Updated] = sysdatetime()
    when not matched by target then
        insert (
            [SourceSystemCode]
           ,[SourceSystemEntryRef]
           ,[JourneyRef]
           ,[OperatingDayDate]
           ,[OperatingDayType]
           ,[DatedVehicleJourneyId]
           ,[DatedVehicleJourneyGid]
           ,[JourneyNumber]
           ,[JourneyPatternId]
           ,[TimedJourneyPatternId]
           ,[LineNumber]
           ,[LineDesignation]
           ,[LineDirectionCode]
           ,[TransportModeCode]
           ,[ContractCode]
           ,[ContractorCode]
           ,[ContractorGarageCode]
           ,[PlannedStartDateTime]
           ,[PlannedEndDateTime]
           ,[PlannedStopCount]
           ,[PlannedPaidDurationSeconds]
           ,[PlannedPaidDistanceMeters]
           ,[IsReplaced]
		   ,[Inserted]
		   ,[Updated] 
        )
        values
        (
            s.[SourceSystemCode], s.[SourceSystemEntryRef], s.[JourneyRef], s.[OperatingDayDate], s.[OperatingDayType]
           ,s.[DatedVehicleJourneyId], s.[DatedVehicleJourneyGid], s.[JourneyNumber], s.[JourneyPatternId]
           ,s.[TimedJourneyPatternId], s.[LineNumber], s.[LineDesignation], s.[LineDirectionCode]
           ,s.[TransportModeCode], s.[ContractCode], s.[ContractorCode], s.[ContractorGarageCode]
           ,s.[PlannedStartDateTime], s.[PlannedEndDateTime], s.[PlannedStopCount], s.[PlannedPaidDurationSeconds]
           ,s.[PlannedPaidDistanceMeters], 0, sysdatetime(), sysdatetime()
        );

    update
        t
    set
        t.[IsReplaced] = 1
	   ,t.[Updated] =  sysdatetime()
    from
        [data].[RT_Journey] t
        left join [stg].[RT_Journey] s on
            s.[JourneyRef] = t.[JourneyRef]
    where
        t.[OperatingDayDate] between @FromOperatingDayDate and @ToOperatingDayDate
        and t.[SourceSystemCode] = @SourceSystemCode
        and s.[JourneyRef] is null;

    if @TruncateStagingAfter = 1
    begin
        truncate table [stg].[RT_Journey];
    end;
end;

GO

