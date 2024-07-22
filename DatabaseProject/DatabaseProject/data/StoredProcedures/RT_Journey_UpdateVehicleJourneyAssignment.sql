
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-06-25
-- Description: Updates [data].[RT_Journey] with (Primary) Vehicle Journey Assignment based on
-- data from [data].[RT_VehicleJourneyAssignment] and business rules on precedence for different
-- source systems.
-- 2023-10-30 LSI: Added [Updated] =  sysdatetime()
-- =============================================
CREATE procedure [data].[RT_Journey_UpdateVehicleJourneyAssignment] (@fromOperatingDayDate date, @toOperatingDayDate date)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    with
    [RankedVehicleJourneyAssignment] as
    (
        select
            vja.[JourneyRef]
           ,vja.[SourceSystemCode]
           ,[PrimaryVehicleGid] = vja.[VehicleGid]
           ,[PrimaryVehicleNumber] = vja.[VehicleNumber]
           ,[PrimaryVehicleAssignedFromDateTime] = vja.[AssignedFromDateTime]
           ,[PrimaryVehicleAssignedToDateTime] = vja.[AssignedToDateTime]
           ,[PrimaryVehicleSeconds] = datediff(s, vja.[AssignedFromDateTime], vja.[AssignedToDateTime])
           ,[TotalVehicleCount] = count(1) over (partition by vja.[SourceSystemCode], vja.[JourneyRef])
           ,[TotalVehicleSeconds] = sum(datediff(s, vja.[AssignedFromDateTime], vja.[AssignedToDateTime])) over (partition by vja.[SourceSystemCode], vja.[JourneyRef])
           ,[Rank] = row_number() over (partition by
                                            vja.[JourneyRef]
                                        order by
                                            calc.[SourceSystemRank]
                                           ,datediff(s, vja.[AssignedFromDateTime], vja.[AssignedToDateTime]) desc
                                  )
        from
            [data].[RT_VehicleJourneyAssignment] vja
            cross apply (
            select
                [SourceSystemRank] = case vja.[SourceSystemCode]
                    when 'PT' then 1
                    when 'RK' then 2 
                    else 99 
                end
        ) calc
        where
            vja.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate
            and vja.[AssignedFromDateTime] < vja.[AssignedToDateTime]
    )
    update
        j
    set
        [VehicleSourceSystemCode] = vja.[SourceSystemCode]
       ,[PrimaryVehicleGid] = vja.[PrimaryVehicleGid]
       ,[PrimaryVehicleNumber] = vja.[PrimaryVehicleNumber]
       ,[PrimaryVehicleAssignedFromDateTime] = vja.[PrimaryVehicleAssignedFromDateTime]
       ,[PrimaryVehicleAssignedToDateTime] = vja.[PrimaryVehicleAssignedToDateTime]
       ,[PrimaryVehicleSeconds] = vja.[PrimaryVehicleSeconds]
       ,[TotalVehicleCount] = vja.[TotalVehicleCount]
       ,[TotalVehicleSeconds] = vja.[TotalVehicleSeconds]
	   ,[Updated] =  sysdatetime()
    from
        [data].[RT_Journey] j
        join [RankedVehicleJourneyAssignment] vja on
            vja.[JourneyRef] = j.[JourneyRef]
            and vja.[Rank] = 1
    where
        j.[OperatingDayDate] between @fromOperatingDayDate and @toOperatingDayDate;

end

GO

