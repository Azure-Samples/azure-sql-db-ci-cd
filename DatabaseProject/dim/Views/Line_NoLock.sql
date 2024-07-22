CREATE view [dim].[Line_NoLock]/****** Script for SelectTopNRows command from SSMS  ******/

as
select l.[LineKey]
      ,l.[RateAreaCombinationKey]
      ,l.[ProductGroupKey]
      ,l.[DefaultTransportModeKey]
      ,l.[ValidFromDateKey]
      ,l.[ValidToDateKey]
      ,l.[IsCurrent]
      ,l.[SourceSystemCode]
      ,l.[SourceSystemEntryId]
      ,l.[RateAreaCombinationCode]
      ,l.[RateAreaCombinationDisplayIndex]
      ,l.[RateAreaCombinationDisplayName]
      ,l.[ProductGroupCode]
      ,l.[ProductGroupName]
      ,l.[ProductGroupDisplayIndex]
      ,l.[ProductGroupDisplayName]
      ,l.[DefaultTransportModeCode]
      ,l.[DefaultTransportModeName]
      ,l.[DefaultTransportModeDisplayIndex]
      ,l.[DefaultTransportModeDisplayName]
      ,l.[TransportAuthorityCode]
      ,l.[TransportAuthorityName]
      ,l.[LineGid]
      ,l.[LineNumber]
      ,l.[LineDesignation]
      ,l.[LineName]
      ,l.[LineDisplayIndex]
      ,l.[LineDisplayName]
      ,l.[LineIsMonitored]
      ,l.[ValidFromDate]
      ,l.[ValidToDate]
      ,l.[LastModifiedUtcDateTime]
	  ,isnull(ldg.[ACLines],0) as [ACLines]
	  ,isnull(ldg.[StrategicNetLines],0) as [StrategicNetLines]
	  ,isnull(ldg.[OtherLines],0) as [OtherLines]
  FROM [dim].[Line] l
  left outer join [dim].[LineDesignationGroup] ldg on ldg.LineDesignation = l.LineDesignation

GO

