

create procedure [integration].[RK_Transaction_Maintenance] (
    @operatingDayDate date
)
as 
begin
-- =============================================
-- Author:		Ran Wang
-- Create date: 2021-11-30
-- Description:	update RK_Transaction and RT_VehicleJourneyAssignment by matched  RK_Transaction  with  RT_Journey in the last 7 days.
-- =============================================

set nocount on;

/* Avoid parameter sniffing. */
declare @_operatingDayDateStart date,
@_operatingDayDateEnd	date;

set @_operatingDayDateEnd = cast(@operatingDayDate as date);
set @_operatingDayDateStart = cast(dateadd(day,-6, @operatingDayDate)	as date);


/* Step 1: Drop temp. table if exists and create it. */
if object_id('tempdb..#RK_Transaction_RT_JourneyPoint_Match') is not null 
    drop table [#RK_Transaction_RT_JourneyPoint_Match];

create table 
    [#RK_Transaction_RT_JourneyPoint_Match] (
        [JourneyRef] char(18),
        [JourneyPointRef] char(22),
        [TransactionID] bigint,
        [MsgReportDate] datetime2(0),
        [TransactionType] tinyint,
        [TransactionStatus] tinyint,
        [TransactionValue] int,        
        [DeviceID] bigint,
        [EquipmentType] tinyint,
        [ShiftNumber] bigint,
        [StaffID] int,
        [VehicleID] int,
        [OperationAction] tinyint,
        [OperationType] tinyint,
		[OperatingDayDate] date

    );

/* Step 2a: Calculate Match between RK_Transaction and RT_Journey Point. */
with
[RK_Transaction_RT_JourneyPoint_Match] as
(
    select
        j.[JourneyRef],
        p.[JourneyPointRef],
        t.[TransactionID],
        t.[MsgReportDate],
        t.[TransactionType],
        t.[TransactionStatus],
        t.[TransactionValue],
        t.[DeviceID],
        t.[EquipmentType],
        t.[ShiftNumber],
        t.[StaffID],
        t.[VehicleID],
        t.[OperationAction],
        t.[OperationType],
		OperatingDayDate = isnull(j.[OperatingDayDate],p.OperatingDayDate),
        /* For journeys that visit the same stop multiple time Rejsekort has no indication to which of the visits the transaction belongs to. */
        [Rank] = row_number() over (partition by t.[TransactionID] order by abs(datediff(second, t.[MsgReportDate], isnull(p.[ObservedDepartureDateTime], p.[PlannedDepartureDateTime]))))
    from
        [data].[RT_Journey] j (nolock)        
        join [integration].[RK_ServiceJourneyBridge] sjb on sjb.[ServiceJourneyGid] = j.[DatedVehicleJourneyGid]
        join [data].[RK_Transaction] t (nolock) on
            t.[MsgReportDate] between dateadd(hour, -8, j.[PlannedStartDateTime]) and dateadd(hour, 8, j.[PlannedEndDateTime])
            and t.[TripID] = [sjb].[Number]
        left join [data].[RT_JourneyPoint] p (nolock) on
            p.[JourneyRef] = j.[JourneyRef]
            and t.[StopPointID] = p.[StopPointNumber]
    where
        j.[OperatingDayDate] >= @_operatingDayDateStart and j.[OperatingDayDate] <= @_operatingDayDateEnd

)
insert into
    [#RK_Transaction_RT_JourneyPoint_Match] (
        [JourneyRef],
        [JourneyPointRef],
        [TransactionID],
        [MsgReportDate],
        [TransactionType],
        [TransactionStatus],
        [TransactionValue],
        [DeviceID],
        [EquipmentType],
        [ShiftNumber],
        [StaffID],
        [VehicleID],
        [OperationAction],
        [OperationType],
		[OperatingDayDate]
    )
select
    [JourneyRef],
    [JourneyPointRef],
    [TransactionID],
    [MsgReportDate],
    [TransactionType],
    [TransactionStatus],
    [TransactionValue],
    [DeviceID],
    [EquipmentType],
    [ShiftNumber],
    [StaffID],
    [VehicleID],
    [OperationAction],
    [OperationType],
	[OperatingDayDate]
from
    [RK_Transaction_RT_JourneyPoint_Match]
where
    [Rank] = 1;

/* Step 2b: Save the match to RK_Transaction. */
update
    t
set
    [JourneyRef] = j.[JourneyRef],
    [JourneyPointRef] = j.[JourneyPointRef]
from
    [data].[RK_Transaction] t
    join [#RK_Transaction_RT_JourneyPoint_Match] j on j.[TransactionID] = t.[TransactionID];

/* Step 3: determine Journey Assignments */
with
[RK_VehicleJourneyAssignment] as
(
    select distinct        
        [SourceSystemCode] = 'RK',
        [SourceSystemEntryRef] = first_value(t.[TransactionID]) over (partition by t.[JourneyRef], t.[VehicleID], t.[DeviceID], t.[EquipmentType] order by [MsgReportDate]),
        [JourneyRef],
        [OperatingDayDate] = t.OperatingDayDate, --@_operatingDayDate,
        [AssignmentType] = 0,
        [AssignedFromDateTime] = min(case when [OperationAction] = 1 then [MsgReportDate] end) over (partition by t.[JourneyRef], t.[VehicleID], t.[DeviceID], t.[EquipmentType]),
        [AssignedToDateTime] = max(case when [OperationAction] = 2 then [MsgReportDate] end) over (partition by t.[JourneyRef], t.[VehicleID], t.[DeviceID], t.[EquipmentType]),
        [VehicleNumber] = t.[VehicleID],
        [DeviceId] = t.[DeviceID],
        [EquipmentType] = t.[EquipmentType]
    from
        [#RK_Transaction_RT_JourneyPoint_Match] t
    where
        -- E_TR_OPERATION_MANAGEMENT = 52
        -- E_OPERATION_ACTION_START = 1, E_OPERATION_ACTION_END = 2
        [TransactionType] = 52 and [OperationAction] in (1, 2)
        and 0 < t.[VehicleID] and t.[VehicleID] < 100000
        and t.[EquipmentType] is not null
)
merge [data].[RT_VehicleJourneyAssignment] as t
using [RK_VehicleJourneyAssignment] as s
on (t.[SourceSystemCode] = s.[SourceSystemCode] and t.[SourceSystemEntryRef] = s.[SourceSystemEntryRef])
when matched then
    update set
        [JourneyRef] = s.[JourneyRef],
        [OperatingDayDate] = s.[OperatingDayDate],
        [AssignmentType] = s.[AssignmentType],
        [AssignedFromDateTime] = s.[AssignedFromDateTime],
        [AssignedToDateTime] = s.[AssignedToDateTime],
        [VehicleNumber] = s.[VehicleNumber],
        [DeviceID] = s.[DeviceID],
        [EquipmentType] = s.[EquipmentType]
when not matched by target then
    insert (
        [SourceSystemCode],
        [SourceSystemEntryRef],
        [JourneyRef],
        [OperatingDayDate],
        [AssignmentType],
        [AssignedFromDateTime],
        [AssignedToDateTime],
        [VehicleNumber],
        [DeviceID],
        [EquipmentType]
    )
    values (
        s.[SourceSystemCode],
        s.[SourceSystemEntryRef],
        s.[JourneyRef],
        s.[OperatingDayDate],
        s.[AssignmentType],
        s.[AssignedFromDateTime],
        s.[AssignedToDateTime],
        s.[VehicleNumber],
        s.[DeviceID],
        s.[EquipmentType]
   )
when not matched by source and t.[SourceSystemCode] = 'RK' and (t.[OperatingDayDate] >= @_operatingDayDateStart and t.[OperatingDayDate] <= @_operatingDayDateEnd) then
    delete;

if object_id('tempdb..#RK_Transaction_RT_JourneyPoint_Match') is not null 
    drop table [#RK_Transaction_RT_JourneyPoint_Match];

end

GO

