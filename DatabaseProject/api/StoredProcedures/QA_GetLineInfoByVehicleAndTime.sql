


-- =============================================
-- Author:		Niklas Christoffer Petersen
-- Create date: 2020-10-02
-- Description:	Used by Quality Assurance system to lookup line and contract details given a vehicle number and a timestamp.
-- =============================================

create procedure [api].[QA_GetLineInfoByVehicleAndTime]
    @vehicleNumber int
   ,@datetime datetime2(0)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on
    ;

    -- Insert statements for procedure here
    select
        j.[LineNumber]
       ,j.[LineDesignation]
       ,j.[TransportModeCode]
       ,l.[ProductGroupCode]
       ,l.[ProductGroupName]
       ,j.[ContractorCode]
       ,c.[ContractorName]
       ,[GarageCode] = j.[ContractorGarageCode]
       ,g.[GarageName]
       ,j.[ContractCode]
       ,con.[ContractName]
       ,con.[TenderCode]
       ,con.[TenderName]
    from
        [data].[RT_VehicleJourneyAssignment] vja
        join [data].[RT_Journey] j on
            j.[JourneyRef] = vja.[JourneyRef]
        join [dim].[Date] d on
            d.[Date] = j.[OperatingDayDate]
        left join [dim].[Line] l on
            l.[LineNumber] = j.[LineNumber]
            and d.[DateKey] between l.[ValidFromDateKey] and l.[ValidToDateKey]
        left join [dim].[Contractor] c on
            c.[ContractorCode] = j.[ContractorCode]
            and d.[DateKey] between c.[ValidFromDateKey] and c.[ValidToDateKey]
        left join [dim].[Garage] g on
            g.[GarageCode] = j.[ContractorGarageCode]
            and d.[DateKey] between g.[ValidFromDateKey] and g.[ValidToDateKey]
        left join [dim].[Contract] con on
            con.[ContractCode] = j.[ContractCode]
            and d.[DateKey] between con.[ValidFromDateKey] and con.[ValidToDateKey]
    where
        vja.[VehicleNumber] = @vehicleNumber
        and @datetime between vja.[AssignedFromDateTimeExpanded] and vja.[AssignedToDateTime] -- We assume timestamp used for queying is when questionnaire personal boards the vehicle. 
        and vja.[SourceSystemCode] = 'PT'
    ;
end
;

GO

