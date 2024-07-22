





CREATE function [data].[MissingOTS] ()

returns @tbl table (
 [Date]  date,
   [VehicleRef] nvarchar(30),
   Garage nvarchar(250),
   Contractor nvarchar(250),
   ContractUnit nvarchar(250),
   [Number of Journeys] int,
   [Number of CountingReports] int,
   OTS nvarchar(250),
   [OTS_Number] int
)

as



begin


;with
    [Date] as
        (
            select
                Date
            from
                dim.Date (nolock)
            where
               Date between '2022-12-01' and cast(getdate() - 1 as date)
        )
,
    [Vehicles] as
        (
            select
                InternalNumber
               ,Garage
               ,Contractor
               ,ContractUnit
            from
                [data].[RT_BusDatabase] (nolock)
            where
                [InternalNumber] in
                (
                    '4138'
                   ,'4139'
                   ,'4140'
                   ,'4141'
                   ,'4142'
                   ,'4143'
                   ,'4144'
                   ,'4145'
                   ,'4146'
                   ,'4147'
                   ,'4148'
                   ,'4149'
                   ,'4150'
                   ,'4151'
                   ,'4152'
                   ,'4153'
                   ,'4154'
                   ,'4155'
                   ,'4156'
                   ,'4157'
				   ,'4158'
                   ,'4884'
                   ,'4885'
                   ,'4886'
                   ,'4887'
                   ,'4888'
                   ,'4889'
                   ,'4890'
                   ,'7491'
                   ,'7492'
                   ,'7493'
                   ,'7494'
                   ,'7495'
                )
                and [IsCurrent] = 1
        --order by InternalNumber
        )
,
    [Journeys] as
        (
            select
                j.OperatingDayDate
               ,j.PrimaryVehicleNumber
               ,count(j.PrimaryVehicleNumber) [Number of Journeys]
            from
                data.RT_Journey (nolock) j
            where
                j.OperatingDayDate between '2022-12-01' and cast(getdate() - 1 as date)
                and j.PrimaryVehicleNumber in
                    (
                        '4138'
                       ,'4139'
                       ,'4140'
                       ,'4141'
                       ,'4142'
                       ,'4143'
                       ,'4144'
                       ,'4145'
                       ,'4146'
                       ,'4147'
                       ,'4148'
                       ,'4149'
                       ,'4150'
                       ,'4151'
                       ,'4152'
                       ,'4153'
                       ,'4154'
                       ,'4155'
                       ,'4156'
                       ,'4157'
					   ,'4158'
                       ,'4884'
                       ,'4885'
                       ,'4886'
                       ,'4887'
                       ,'4888'
                       ,'4889'
                       ,'4890'
                       ,'7491'
                       ,'7492'
                       ,'7493'
                       ,'7494'
                       ,'7495'
                    )
            group by
                j.OperatingDayDate
               ,j.PrimaryVehicleNumber
        )
,
    [OTS] as
        (
            select
                cast([DateTime] as date) [Date]
               ,VehicleRef
               ,count(VehicleRef) [Number of CountingReports]
            from
                data.APC_OTS_CountingReport (nolock)
            group by
                cast([DateTime] as date)
               ,VehicleRef
        )
		
insert into @tbl ([Date], [VehicleRef], Garage,Contractor,ContractUnit,[Number of Journeys],[Number of CountingReports],[OTS],[OTS_Number])
select
    d.Date
   ,v.InternalNumber [VehicleRef]
   ,v.Garage
   ,v.Contractor
   ,v.ContractUnit
   ,j.[Number of Journeys]
   ,OTS.[Number of CountingReports]
   ,[OTS] = case
                when dis.Dispensation = 9876303
                    then 'Dispensation'
                when j.[Number of Journeys] is null
                     and OTS.[Number of CountingReports] is null
                    then 'Ingen data'
                when j.[Number of Journeys] > 0
                     and OTS.[Number of CountingReports] > 0
                    then 'OTS OK'
                when j.[Number of Journeys] > 0
                     and OTS.[Number of CountingReports] is null
                    then 'Ingen OTS-data'
                when j.[Number of Journeys] is null
                     and OTS.[Number of CountingReports] > 0
                    then 'Kun OTS-data'
                else 'Fejl'
            end

		   ,[OTS_Number] = case
                when dis.Dispensation = 9876303
                    then 1
                when j.[Number of Journeys] is null
                     and OTS.[Number of CountingReports] is null
                    then 2
                when j.[Number of Journeys] > 0
                     and OTS.[Number of CountingReports] > 0
                    then 3
                when j.[Number of Journeys] > 0
                     and OTS.[Number of CountingReports] is null
                    then 4
                when j.[Number of Journeys] is null
                     and OTS.[Number of CountingReports] > 0
                    then 5
                else 6
            end
from
    Date d
    cross join Vehicles v
    left join Journeys j on
        d.Date = j.OperatingDayDate
        and v.InternalNumber = j.PrimaryVehicleNumber
    left join OTS on
        OTS.Date = d.Date
        and v.InternalNumber = OTS.VehicleRef
    left join data.QC_Dispensation (nolock) dis on
        dis.BussNo = v.InternalNumber
        and d.Date between cast(dis.DispensationFrom as date) and cast(dis.DispensationTo as date)
        and dis.IsCurrent = 1
        and dis.Dispensation = 9876303
        and dis.StatusText = 'Godkendt'
		and dis.StatusID in (29,34) 

        
		

	
return;
end;

GO

