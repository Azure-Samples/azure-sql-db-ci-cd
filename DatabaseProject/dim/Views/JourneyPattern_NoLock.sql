create view [dim].[JourneyPattern_NoLock]

AS

SELECT [JourneyPatternKey]
      ,[LineKey]
      ,[LineDirectionKey]
      ,[ValidFromDateKey]
      ,[ValidToDateKey]
      ,[IsCurrent]
      ,[SourceSystemCode]
      ,[SourceSystemEntryId]
      ,[LineGid]
      ,[LineNumber]
      ,jp.[LineDesignation]
      ,[LineName]
      ,[LineDisplayIndex]
      ,[LineDisplayName]
      ,[LineDirectionGid]
      ,[LineDirectionCode]
      ,[LineDirectionName]
      ,[LineDirectionDisplayName]
      ,[JourneyPatternId]
      ,[JourneyPatternName]
      ,[JourneyPatternDisplayName]
      ,[JourneyPatternPointCount]
      ,[JourneyPatternStopPointCount]
      ,[JourneyPatternGroupByKey]
      ,[JourneyPatternGroupByKeyAlternative]
      ,[ValidFromDate]
      ,[ValidToDate]
      ,[JourneyPatternStartStopPointNumber]
      ,[JourneyPatternStartStopPointName]
      ,[JourneyPatternEndStopPointNumber]
      ,[JourneyPatternEndStopPointName]
      ,[LineDirectionDisplayIndex]
      ,[RateAreaCombinationKey]
      ,[ProductGroupKey]
      ,[RateAreaCombinationCode]
      ,[RateAreaCombinationDisplayIndex]
      ,[RateAreaCombinationDisplayName]
      ,[ProductGroupCode]
      ,[ProductGroupDisplayIndex]
      ,[ProductGroupDisplayName]
      ,[JourneyPatternGroupKey]
      ,[JourneyPatternGroupCode]
      ,[JourneyPatternGroupName]
      ,[JourneyPatternGroupDisplayName]
      ,[JourneyPatternDisplayIndex]
      ,[DefaultTransportModeKey]
      ,[DefaultTransportModeCode]
      ,[DefaultTransportModeName]
      ,[DefaultTransportModeDisplayIndex]
      ,[DefaultTransportModeDisplayName]
	  ,isnull(ldg.[ACLines],0) AS [ACLines]
	  ,isnull(ldg.[StrategicNetLines],0) AS [StrategicNetLines]
	  ,isnull(ldg.[OtherLines],0) AS [OtherLines]
  FROM [dim].[JourneyPattern] jp
  LEFT OUTER JOIN [dim].[LineDesignationGroup] ldg on ldg.LineDesignation = jp.LineDesignation

GO

