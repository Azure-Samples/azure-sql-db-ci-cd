




CREATE view [dim].[JourneyPattern_JourneyCount_NoLock] as 


	with JourneyCountPrDay (OperatingDayDate, LineNumber,  JourneyCount) as
	(
	select OperatingDayDate, LineNumber,count(1) as [Count]
	from [data].[RT_Journey] (nolock)
	where 
	datepart(m, OperatingDayDate) = datepart(m, dateadd(m, -1, getdate()))
	and datepart(yyyy, OperatingDayDate) = datepart(yyyy, dateadd(m, -1, getdate()))

	group by OperatingDayDate
			,LineNumber
	)



	select        jp.JourneyPatternKey, jp.LineKey, jp.LineDirectionKey, jp.ValidFromDateKey, jp.ValidToDateKey, jp.IsCurrent, jp.SourceSystemCode, jp.SourceSystemEntryId, jp.LineGid, jp.LineNumber, jp.LineDesignation, jp.LineName, 
							 jp.LineDisplayIndex, jp.LineDisplayName, jp.LineDirectionGid, jp.LineDirectionCode, jp.LineDirectionName, jp.LineDirectionDisplayName, jp.JourneyPatternId, jp.JourneyPatternName, jp.JourneyPatternDisplayName, 
						     jp.JourneyPatternPointCount, jp.JourneyPatternStopPointCount, jp.JourneyPatternGroupByKey, jp.JourneyPatternGroupByKeyAlternative, jp.ValidFromDate, jp.ValidToDate, jp.JourneyPatternStartStopPointNumber, 
							 jp.JourneyPatternStartStopPointName, jp.JourneyPatternEndStopPointNumber, jp.JourneyPatternEndStopPointName, jp.LineDirectionDisplayIndex, jp.RateAreaCombinationKey, jp.ProductGroupKey, 
					    	 jp.RateAreaCombinationCode, jp.RateAreaCombinationDisplayIndex, jp.RateAreaCombinationDisplayName, jp.ProductGroupCode, jp.ProductGroupDisplayIndex, jp.ProductGroupDisplayName, jp.JourneyPatternGroupKey, 
							 jp.JourneyPatternGroupCode, jp.JourneyPatternGroupName, jp.JourneyPatternGroupDisplayName, jp.JourneyPatternDisplayIndex, jp.DefaultTransportModeKey, jp.DefaultTransportModeCode, jp.DefaultTransportModeName, 
							 jp.DefaultTransportModeDisplayIndex, jp.DefaultTransportModeDisplayName
							 , case when d .LineNumber is null then '0' else '1' end as IsNytBynet
							 ,j.MaxDailyJourneyCountPreviousMonth
							  ,isnull(ldg.[ACLines],0) AS [ACLines]
							  ,isnull(ldg.[StrategicNetLines],0) AS [StrategicNetLines]
							  ,isnull(ldg.[OtherLines],0) AS [OtherLines]

	from [dim].[JourneyPattern] (nolock) as jp 
	left outer join  [dim].[Line_Nyt_Bynet] as d on jp.LineNumber = d.LineNumber
	left join (select  LineNumber ,max(JourneyCount) MaxDailyJourneyCountPreviousMonth from JourneyCountPrDay jc group by jc.LineNumber) j on j.LineNumber=jp.LineNumber
	LEFT OUTER JOIN [dim].[LineDesignationGroup] ldg on ldg.LineDesignation = jp.LineDesignation

GO

