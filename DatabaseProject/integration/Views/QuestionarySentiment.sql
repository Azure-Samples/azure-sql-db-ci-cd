create view [integration].[QuestionarySentiment] as

select 
       QA_DigitalSurvey_Questionary.[SourceSystemEntryRef]
	   ,fact.QA_DigitalSurvey_Sentiment.Survey
	   ,fact.QA_DigitalSurvey_Sentiment.Respondent
	   ,fact.QA_DigitalSurvey_Sentiment.TopicKey
	   ,fact.QA_DigitalSurvey_Sentiment.Text
	   ,fact.QA_DigitalSurvey_Sentiment.WordCloud
	   ,fact.QA_DigitalSurvey_Sentiment.OverallScore
	   ,faCT.QA_DigitalSurvey_Sentiment.Probability
	   ,FACT.QA_DigitalSurvey_Sentiment.SentimentValue
	   ,FACT.QA_DigitalSurvey_Sentiment.Variable
from
    [fact].[QA_DigitalSurvey_Questionary]

	inner join fact.QA_DigitalSurvey_Sentiment on QA_DigitalSurvey_Sentiment.Respondent = QA_DigitalSurvey_Questionary.Respondent

GO

