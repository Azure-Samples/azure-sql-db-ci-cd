CREATE TABLE [fact].[QA_DigitalSurvey_Sentiment] (
    [SourceSystemCode]     NVARCHAR (10)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NOT NULL,
    [Survey]               INT            NULL,
    [Respondent]           INT            NULL,
    [Variable]             VARCHAR (50)   NULL,
    [TopicKey]             INT            NOT NULL,
    [Text]                 NVARCHAR (MAX) NULL,
    [WordCloud]            NVARCHAR (MAX) NULL,
    [OverallScore]         NUMERIC (5, 3) NULL,
    [Probability]          NUMERIC (7, 6) NULL,
    [SentimentValue]       NUMERIC (5, 3) NULL,
    [inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 VARBINARY (32) NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_Sentiment] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC, [TopicKey] ASC)
);


GO

