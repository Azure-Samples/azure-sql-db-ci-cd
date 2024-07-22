





create procedure [stg].[RK_Transaction_Pb_RemoveDuplicatedRows]
as
begin
-- =============================================
-- Author:		Ran Wang
-- Create date: 2021-11-23
-- Description:	remove duplicated rows from all 4 staging tables.
-- =============================================
with
    [A] as
    (
        select
            [DoubletRank] = row_number() over (partition by
                                                   [MsgReportDate]
                                                  ,[ApplicationTransactionSequenceNumber]
                                                  ,[CardEngravedID]
                                                  ,[DeviceID]
                                                  ,[StationID]
                                                  ,[StopPointID]
                                                  ,isnull([tPurseNewRemainingValue], 0)
                                                  ,isnull([tPurseRemainingValue], 0)
                                                  ,[tPurseTransactionSequenceNumber]
                                                  --,isnull([OperationType], 0)
                                                  ,[TransactionType]
                                               order by
                                                  -- [IsException]
                                                  --,
												  [MessageReceptionDate]
                                                  ,[MsgSequenceNumber]
                                         )
        from
            [stg].[RK_Transaction_Sales_Pb]
    )
delete from
[A]
where
    [DoubletRank] > 1
;

delete from
[stg].[RK_Transaction_Sales_Pb]
where
    [TransactionID] = 0
;

with
    [A] as
    (
        select
            [DoubletRank] = row_number() over (partition by
                                                   [MsgReportDate]
                                                  ,[ApplicationTransactionSequenceNumber]
                                                  ,[CardEngravedID]
                                                  ,[DeviceID]
                                                  ,[StationID]
                                                  ,[StopPointID]
                                                  ,isnull([tPurseNewRemainingValue], 0)
                                                  ,isnull([tPurseRemainingValue], 0)
                                                  ,[tPurseTransactionSequenceNumber]
                                                  --,isnull([OperationType], 0)
                                                  ,[TransactionType]
                                               order by
                                                  -- [IsException]
                                                  --,
												  [MessageReceptionDate]
                                                  ,[MsgSequenceNumber]
                                         )
        from
            [stg].[RK_Transaction_Usage_Pb]
    )
delete from
[A]
where
    [DoubletRank] > 1
;

delete from
[stg].[RK_Transaction_Usage_Pb]
where
    [TransactionID] = 0
;
with
    [A] as
    (
        select
            [DoubletRank] = row_number() over (partition by
                                                   [MsgReportDate]
                                                  ,[ApplicationTransactionSequenceNumber]
                                                  ,[CardEngravedID]
                                                  ,[DeviceID]
                                                  ,[StationID]
                                                  ,[StopPointID]
                                                  --,isnull([tPurseNewRemainingValue], 0)
                                                  --,isnull([tPurseRemainingValue], 0)
                                                  --,[tPurseTransactionSequenceNumber]
                                                  ,isnull([OperationType], 0)
                                                  ,[TransactionType]
                                               order by
                                                  -- [IsException]
                                                  --,
												  [MessageReceptionDate]
                                                  ,[MsgSequenceNumber]
                                         )
        from
            [stg].[RK_Transaction_Operational_Pb]
    )
delete from
[A]
where
    [DoubletRank] > 1
;


delete from
[stg].[RK_Transaction_Operational_Pb]
where
    [TransactionID] = 0
;


with
    [A] as
    (
        select
            [DoubletRank] = row_number() over (partition by
                                                   [MsgReportDate]
                                                  ,[ApplicationTransactionSequenceNumber]
                                                  ,[CardEngravedID]
                                                  ,[DeviceID]
                                                  ,[StationID]
                                                  ,[StopPointID]
                                                  ,isnull([tPurseNewRemainingValue], 0)
                                                  ,isnull([tPurseRemainingValue], 0)
                                                  ,[tPurseTransactionSequenceNumber]
                                                  ,isnull([OperationType], 0)
                                                  ,[TransactionType]
                                               order by
                                                   [IsException]                                             
												  ,[MessageReceptionDate]
                                                  ,[MsgSequenceNumber]
                                         )
        from
            [stg].[RK_Transaction_Exceptions_Pb]
    )
delete from
[A]
where
    [DoubletRank] > 1
;

delete from
 [stg].[RK_Transaction_Exceptions_Pb]
where
    [TransactionID] = 0
;



end;

GO

