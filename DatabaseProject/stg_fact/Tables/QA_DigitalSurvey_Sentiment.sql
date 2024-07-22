CREATE TABLE [stg_fact].[QA_DigitalSurvey_Sentiment] (
    [SourceSystemCode]     NVARCHAR (10)  NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NULL,
    [Survey]               INT            NULL,
    [Respondent]           INT            NULL,
    [Variable]             NVARCHAR (50)  NULL,
    [TopicKey]             INT            NULL,
    [Text]                 NVARCHAR (MAX) NULL,
    [JsonText]             NVARCHAR (MAX) NULL,
    [WordCloud]            NVARCHAR (MAX) NULL,
    [OverallScore]         NUMERIC (5, 3) NULL,
    [Probability]          NUMERIC (7, 6) NULL,
    [SentimentValue]       NUMERIC (5, 3) NULL,
    [TopicName]            NVARCHAR (20)  NULL
);


GO

