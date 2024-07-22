








create view [fact].[ACCT_Settlement_Interval]
as
select
    [JourneyRef]
   ,[OperatingDateKey]
   ,[ContractorKey]
   ,[ContractKey]
   ,[ContractorGarageKey]
   ,[FirstPlannedSequenceNumber]
   ,[LastPlannedSequenceNumber]
   ,[FirstPlannedDepartureDateKey]
   ,[FirstPlannedDepartureTimeKey]
   ,[JourneyNumber]
   ,[PlannedStopCount]
   ,[ClassKey]
   ,[FromStopPointKey]
   ,[FromStopPointNumber] = cast(right([FromJourneyPointRef], 3) as int)
   ,[ToStopPointKey]
   ,[ToStopPointNumber] = cast(right([ToJourneyPointRef], 3) as int)
   ,[SettlementKey]
   ,[PlannedDuration]
   ,[PartialDuration]
   ,[IsException]
   ,[PaymentTypeKey]
   ,[VehicleKey]
   ,[LineKey]
   ,[LineDirectionCode]
   ,[IsMultipleIntervals]
   ,[IsRPSMatch]
   ,[IsMonthly] = 0
   ,[Inserted]
   ,Updated
from
    [fact].[ACCT_Settlement_Interval_Daily]
union
select
    [JourneyRef]
   ,[OperatingDateKey]
   ,[ContractorKey]
   ,[ContractKey]
   ,[ContractorGarageKey]
   ,[FirstPlannedSequenceNumber]
   ,[LastPlannedSequenceNumber]
   ,[FirstPlannedDepartureDateKey]
   ,[FirstPlannedDepartureTimeKey]
   ,[JourneyNumber]
   ,[PlannedStopCount]
   ,[ClassKey]
   ,[FromStopPointKey]
   ,[FromStopPointNumber] = cast(right([FromJourneyPointRef], 3) as int)
   ,[ToStopPointKey]
   ,[ToStopPointNumber] = cast(right([ToJourneyPointRef], 3) as int)
   ,[SettlementKey]
   ,[PlannedDuration]
   ,[PartialDuration]
   ,[IsException]
   ,[PaymentTypeKey]
   ,[VehicleKey]
   ,[LineKey]
   ,[LineDirectionCode]
   ,[IsMultipleIntervals]
   ,[IsRPSMatch]
   ,[IsMonthly] = 1
   ,[Inserted]
   ,Updated
from
    [fact].[ACCT_Settlement_Interval_Monthly];

GO

