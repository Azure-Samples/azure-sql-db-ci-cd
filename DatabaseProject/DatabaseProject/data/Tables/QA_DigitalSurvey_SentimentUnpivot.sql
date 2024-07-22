CREATE TABLE [data].[QA_DigitalSurvey_SentimentUnpivot] (
    [SourceSystemCode]     NVARCHAR (10)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NOT NULL,
    [Survey]               INT            NOT NULL,
    [Respondent]           INT            NOT NULL,
    [Variable]             VARCHAR (50)   NOT NULL,
    [Text]                 NVARCHAR (MAX) NULL,
    [ModelTrained]         NVARCHAR (255) NULL,
    [JSON]                 NVARCHAR (MAX) NULL,
    [WordCloud]            NVARCHAR (MAX) NULL,
    [OverallScore]         NUMERIC (6, 3) NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 BINARY (32)    NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_SentimentUnpivot] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

