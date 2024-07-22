CREATE view [fact].[RT_SuppliedOperation_NoLock] as 
select
    [DateKey]
   ,[ContractorKey]
   ,[GarageKey]
   ,[TimeKey]
   ,[LineKey]
   ,[K2StatusKey]
   ,[K5StatusKey]
   ,[FrequencyTypeKey]
   ,[JourneyPatternKey]
   ,[StopPointKey]
   ,[MunicipalityKey]
   ,[JourneyRef]
   ,[OperatingDayDate]
   ,[StopPointId]
   ,[SequenceNumber]
   ,[MaxSequenceNumber]
   ,[PlannedArrivalDateTime]
   ,[ObservedArrivalDateTime]
   ,[FrequencyType]
   ,[K2]
   ,[K5]
   ,[PlannedDepartureDateTime]
   ,[Hour]
   ,[StatusKeySharePerJourneyRef]
   ,[StatusKeySharePerJourneyRef Alt] as [StatusKeySharePerJourneyRefAlt]
   ,UniqueKey=concat(
               DateKey
              ,'-'
              ,ContractorKey
              ,'-'
              ,MunicipalityKey
              ,'-'
              ,JourneyRef
              ,'-'
              ,row_number() over (order by DateKey)
           )
	,Updated=OperatingDayDate
from
    [fact].[RT_SuppliedOperation] with (nolock);

GO

