CREATE TABLE [dim].[QA_SurveyAnswer] (
    [SurveyAnswerKey]        INT             IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]       INT             NOT NULL,
    [ValidToDateKey]         INT             NOT NULL,
    [IsCurrent]              BIT             NOT NULL,
    [SourceSystemCode]       NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryId]    BIGINT          NULL,
    [SurveyQuestionType]     INT             NOT NULL,
    [SurveyAnswerValue]      INT             NOT NULL,
    [SurveyAnswerText]       VARCHAR (50)    NOT NULL,
    [SurveyQuestionTypeText] VARCHAR (255)   NULL,
    [Weight]                 DECIMAL (18, 4) NULL,
    CONSTRAINT [PK_QA_SurveyAnswer] PRIMARY KEY CLUSTERED ([SurveyAnswerKey] ASC)
);


GO

