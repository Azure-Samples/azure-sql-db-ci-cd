
CREATE view [dim].[StopPointSubSet_NoLock]

as 


SELECT [StopPointKey]
      ,[MunicipalityKey]
      ,[RateAreaKey]
      ,[TariffZoneKey]
      ,[ValidFromDateKey]
      ,[ValidToDateKey]
      ,[IsCurrent]
      ,[MunicipalityDisplayIndex]
      ,[RateAreaDisplayIndex]
      ,[TariffZoneDisplayIndex]
      ,[TariffZoneNumber]
      ,[JourneyPatternPointGid]
      ,[JourneyPatternPointNumber]
      ,[JourneyPatternPointEastingCoordinate]
      ,[JourneyPatternPointNorthingCoordinate]
      ,[StopPointGid]
      ,[StopPointNumber]
      ,[StopPointDisplayIndex]
      ,cast([StopPointName] as varchar(250)) as [StopPointName]
      ,[StopPointIsForBoarding]
      ,[StopPointIsForAlighting]
      ,[ValidFromDate]
      ,[ValidToDate]
      ,[LastModifiedUtcDateTime]
      ,[JourneyPatternPointLatitude]
      ,[JourneyPatternPointLongitude]
      ,[StopPointOwner]
      ,[StopPointId]
  FROM [dim].[StopPoint] with (nolock)

GO

