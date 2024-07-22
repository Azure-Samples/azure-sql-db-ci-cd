

create view [data].[ACCT_Settlement_VehicleJourneyAssignment_Daily]
as
with
[PT] as
(
    select
        [PTSourceSystemEntryRef] = [A].[SourceSystemEntryRef]
       ,[PTJourneyRef] = [A].[JourneyRef]
       ,[PTVehicleNumber] = [A].[VehicleNumber]
       ,[PTAssignmentType] = [A].[AssignmentType]
       ,[PTAssignedFromDateTime] = [A].[AssignedFromDateTime]
       ,[PTAssignedToDateTime] = [A].[AssignedToDateTime]
       ,[PTSourceSystemCode] = [A].[SourceSystemCode]
       ,[PTDuration] = datediff(second, [AssignedFromDateTime], [AssignedToDateTime])
    from
        [data].[ACCT_Settlement_PTVehicleJourneyAssignment_Daily] as [A]
    where
        datediff(second, [AssignedFromDateTime], [AssignedToDateTime]) = (
        select
            [MaxDuration] = max(datediff(second, [AssignedFromDateTime], [AssignedToDateTime]))
        from
            [data].[ACCT_Settlement_PTVehicleJourneyAssignment_Daily] as [B]
        where
            [A].[JourneyRef] = [B].[JourneyRef]
        group by
            [JourneyRef]
    )
)
,
[RK] as
(
    select
        [RKSourceSystemEntryRef] = [A].[SourceSystemEntryRef]
       ,[RKJourneyRef] = [A].[JourneyRef]
       ,[RKVehicleNumber] = [A].[VehicleNumber]
       ,[RKAssignmentType] = [A].[AssignmentType]
       ,[RKAssignedFromDateTime] = [A].[AssignedFromDateTime]
       ,[RKAssignedToDateTime] = [A].[AssignedToDateTime]
       ,[RKSourceSystemCode] = [A].[SourceSystemCode]
       ,[RKDuration] = datediff(second, [AssignedFromDateTime], [AssignedToDateTime])
    from
        [data].[ACCT_Settlement_RKVehicleJourneyAssignment_Daily] as [A]
    where
        datediff(second, [AssignedFromDateTime], [AssignedToDateTime]) = (
        select
            [MaxDuration] = max(datediff(second, [AssignedFromDateTime], [AssignedToDateTime]))
        from
            [data].[ACCT_Settlement_RKVehicleJourneyAssignment_Daily] as [B]
        where
            [A].[JourneyRef] = [B].[JourneyRef]
        group by
            [JourneyRef]
    )
)
,
[PTandRK] as
(
    select
        [PT].[PTSourceSystemEntryRef]
       ,[PT].[PTJourneyRef]
       ,[PT].[PTVehicleNumber]
       ,[PT].[PTAssignmentType]
       ,[PT].[PTAssignedFromDateTime]
       ,[PT].[PTAssignedToDateTime]
       ,[PT].[PTSourceSystemCode]
       ,[PT].[PTDuration]
       ,[RK].[RKSourceSystemEntryRef]
       ,[RK].[RKJourneyRef]
       ,[RK].[RKVehicleNumber]
       ,[RK].[RKAssignmentType]
       ,[RK].[RKAssignedFromDateTime]
       ,[RK].[RKAssignedToDateTime]
       ,[RK].[RKSourceSystemCode]
       ,[RK].[RKDuration]
    from
        [PT]
        left join [RK] on
            [RK].[RKJourneyRef] = [PT].[PTJourneyRef]
)
,
[Combined] as
(
    select
        [SourceSystemEntryRef] = case
                                     when [PTVehicleNumber] is not null then [PTSourceSystemEntryRef]
                                     when [PTVehicleNumber] is null
                                          and [RKVehicleNumber] is not null then [RKSourceSystemEntryRef]
                                     else null
                                 end
       ,[JourneyRef] = [PTJourneyRef]
       ,[VehicleNumber] = case
                              when [PTVehicleNumber] is not null then [PTVehicleNumber]
                              when [PTVehicleNumber] is null
                                   and [RKVehicleNumber] is not null then [RKVehicleNumber]
                              else null
                          end
       ,[AssignedFromDateTime] = case
                                     when [PTVehicleNumber] is not null then [PTAssignedFromDateTime]
                                     when [PTVehicleNumber] is null
                                          and [RKVehicleNumber] is not null then [RKAssignedFromDateTime]
                                     else null
                                 end
       ,[AssignedToDateTime] = case
                                   when [PTVehicleNumber] is not null then [PTAssignedToDateTime]
                                   when [PTVehicleNumber] is null
                                        and [RKVehicleNumber] is not null then [RKAssignedToDateTime]
                                   else null
                               end
       ,[AssignmentType] = case
                               when [PTVehicleNumber] is not null then [PTAssignmentType]
                               when [PTVehicleNumber] is null
                                    and [RKVehicleNumber] is not null then [RKAssignmentType]
                               else null
                           end
       ,[Duration] = case
                         when [PTVehicleNumber] is not null then [PTDuration]
                         when [PTVehicleNumber] is null
                              and [RKVehicleNumber] is not null then [RKDuration]
                         else null
                     end
       ,[SourceSystemCode] = case
                                 when [PTVehicleNumber] is not null then 'PT'
                                 when [PTVehicleNumber] is null
                                      and [RKVehicleNumber] is not null then 'RK'
                                 else null
                             end
    from
        [PTandRK]
)
select
    [A].[SourceSystemEntryRef]
   ,[A].[JourneyRef]
   ,[A].[VehicleNumber]
   ,[A].[AssignedFromDateTime]
   ,[A].[AssignedToDateTime]
   ,[A].[AssignmentType]
   ,[A].[Duration]
   ,[A].[SourceSystemCode]
from
    [Combined] as [A]
where
    [AssignedFromDateTime] = (
    select
        max([B].[AssignedFromDateTime])
    from
        [Combined] as [B]
    where
        [A].[JourneyRef] = [B].[JourneyRef]
    group by
        [JourneyRef]
);

GO

