
-- ===============================================
--2023-10-30 LSI: Added [Updated] =  sysdatetime()
-- ===============================================
CREATE procedure [data].[RT_JourneyCancellation_InsertFromJourneyDeviationScope]
as
begin

    declare @LastModifiedUtcDateTimeMark datetime2(3);

    -- Get last processes date time mark
    select
        @LastModifiedUtcDateTimeMark = isnull(max(LastModifiedUtcDateTime), '1900-01-01 00:00:00')
    from
        [data].[RT_JourneyCancellation];

    -- Truncate table Pre Load
    truncate table [stg].[RT_JourneyCancellation];

    -- Stage data
    insert into
        [stg].[RT_JourneyCancellation]
    (
        [JourneyRef]
       ,[SourceSystemCode]
       ,[SourceSystemEntryRef]
       ,[OperationActionTypeCode]
       ,[DeviationReasonStandardCategoryCode]
       ,[DeviationReasonCustomCategoryCode]
       ,[ExternalSourceSystemCode]
       ,[SourceSystemDeviationCaseRef]
       ,[CreatedUtcDateTime]
       ,[LastModifiedUtcDateTime]
       ,[RegistrationDateTime]
       ,[RevokedDateTime]
       ,[ReportedByUserName]
    )
    select
        j.[JourneyRef]
       ,jds.[SourceSystemCode]
       ,jds.[SourceSystemEntryRef]
       ,jds.[OperationActionTypeCode]
       ,jds.[DeviationReasonStandardCategoryCode]
       ,jds.[DeviationReasonCustomCategoryName]
       ,jds.[ExternalSourceSystemCode]
       ,jds.[SourceSystemDeviationCaseRef]
       ,jds.[CreatedUtcDateTime]
       ,jds.[LastModifiedUtcDateTime]
       ,jds.[RegistrationDateTime]
       ,jds.[RevokedDateTime]
       ,jds.[ReportedByUserName]
    from
        [data].[RT_JourneyDeviationScope] jds
        join [data].RT_Journey j on
            jds.[DatedVehicleJourneyGid] = j.[DatedVehicleJourneyGid]
            and j.PlannedStartDateTime between cast(jds.[FromDateTime] as datetime) and cast(jds.[UptoDateTime] as datetime)
    where
        jds.[OperationActionTypeCode] in ( 'J_CANCEL', 'P_J_CANC' )
        and jds.[LastModifiedUtcDateTime] >= @LastModifiedUtcDateTimeMark;

    -- Auto Merge
    exec [integration].[AutoMerge]
        @Source = '[stg].[RT_JourneyCancellation]'
       ,@Target = '[data].[RT_JourneyCancellation]'
       ,@Mode = 1
       ,@TruncateSourceAfterMerge = 0;
    
    -- Update HasCancellation flag on RT_Journey.
    update
        j
    set
        j.[HasCancellation] = case when jc.[RevokedDateTime] is null then 1 else 0 end
	   ,j.[Updated] =  sysdatetime()

    from
        [stg].[RT_JourneyCancellation] jc
        join [data].[RT_Journey] j on j.[JourneyRef] = jc.[JourneyRef];

    -- Truncate table Post Load
    truncate table [stg].[RT_JourneyCancellation];

    update
        [data].[RT_Journey]
    set
        [HasCancellation] = isnull([HasCancellation], 0)
	   ,[Updated] =  sysdatetime()
    where
        [OperatingDayDate] > getdate() - 30;

end;

GO

