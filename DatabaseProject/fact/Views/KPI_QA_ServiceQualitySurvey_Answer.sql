











create view [fact].[KPI_QA_ServiceQualitySurvey_Answer]
as
select 
	DateKey
	,TimeKey
	,LineKey
	,ContractorKey
	,SurveyQuestionKey
	,DataQualityTypeKey
	,OperatingDayTypeKey
	,SurveyQuestionTypeName as SurveyQuestionType
	,SurveyQuestionTypeId
	,SurveyQuestionDisplayName as SurveyQuestion
	,SurveyQuestionDisplayIndex
	,pvt.SurveyAnswerText
	,sum(isnull([1], 0)) as 'Answer_MegetTilfreds'
	,sum(isnull([2], 0)) as 'Answer_Tilfreds'
	,sum(isnull([3], 0)) as 'Answer_BådeOg'
	,sum(isnull([4], 0)) as 'Answer_Utilfreds'
	,sum(isnull([5], 0)) as 'Answer_MegetUtilfreds'
	,sum(isnull([6], 0)) as 'Answer_VedIkke'
	,sum(isnull([7], 0)) as 'Answer_IkkeRelevant'
	,sum(isnull([1], 0)+isnull([2], 0)+isnull([3], 0)+isnull([4], 0)+isnull([5], 0)+isnull([6], 0)+isnull([7], 0)) as SurveyQuestionCount
from 
(
select
	f.DateKey
	,f.ContractorKey
	,f.TimeKey
	,f.LineKey
	,f.JourneyRef
	,f.DataQualityTypeKey
	,f.OperatingDayTypeKey
	,q.SurveyQuestionTypeName
	,q.SurveyQuestionTypeId
	,q.SurveyQuestionKey
	,q.SurveyQuestionDisplayIndex
	,q.SurveyQuestionDisplayName
	,a.SurveyAnswerValue
	,a.SurveyAnswerText
	,count(*) as cnt

from
    fact.QA_ServiceQualitySurvey_Answer as f
    left join dim.QA_SurveyQuestion as q on f.SurveyQuestionKey = q.SurveyQuestionKey and q.SurveyQuestionTypeName = 'Kundetilfredshed'
    left join [dim].[QA_SurveyAnswer] as a on f.SurveyAnswerKey = a.SurveyAnswerKey
where f.surveyanswerkey <> -1
group by 
	f.DateKey
	,f.ContractorKey
	,f.JourneyRef
	,f.DataQualityTypeKey
	,f.LineKey
	,f.TimeKey
	,f.OperatingDayTypeKey
	,q.SurveyQuestionTypeId
	,q.SurveyQuestionTypeName
	,q.SurveyQuestionDisplayName
	,a.SurveyAnswerValue
	,a.SurveyAnswerText
	,q.SurveyQuestionKey
	,q.SurveyQuestionDisplayIndex

) as p
pivot
(
sum(cnt)
for SurveyAnswerValue in ( [1], [2], [3], [4], [5], [6], [7] )
) as pvt
group by 
	DateKey
	,TimeKey
	,LineKey
	,ContractorKey
	,DataQualityTypeKey
	,OperatingDayTypeKey
	,SurveyQuestionTypeName
	,SurveyQuestionTypeId
	,SurveyQuestionDisplayName
	,SurveyQuestionKey
	,SurveyQuestionDisplayIndex
	,SurveyAnswerText

GO

