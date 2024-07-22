CREATE TABLE [stg].[QA_DigitalSurvey_SentimentUnpivot] (
    [SourceSystemCode]     NVARCHAR (10)  NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NULL,
    [Survey]               INT            NULL,
    [Respondent]           INT            NULL,
    [Variable]             VARCHAR (50)   NULL,
    [Text]                 NVARCHAR (MAX) NULL,
    [ModelTrained]         NVARCHAR (255) NULL,
    [JSON]                 NVARCHAR (MAX) NULL,
    [WordCloud]            NVARCHAR (MAX) NULL,
    [OverallScore]         NUMERIC (6, 3) NULL
);


GO

