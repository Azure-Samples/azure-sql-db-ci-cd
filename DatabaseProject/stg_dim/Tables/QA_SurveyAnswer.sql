CREATE TABLE [stg_dim].[QA_SurveyAnswer] (
    [SurveyQuestionKey]      INT             NULL,
    [ValidFromDate]          DATE            NULL,
    [ValidToDate]            DATE            NULL,
    [IsCurrent]              BIT             NULL,
    [SourceSystemCode]       NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryId]    BIGINT          NULL,
    [SurveyQuestionType]     BIGINT          NULL,
    [SurveyQuestionTypeText] NVARCHAR (255)  NULL,
    [SurveyAnswerValue]      INT             NULL,
    [SurveyAnswerText]       NVARCHAR (255)  NULL,
    [Weight]                 DECIMAL (18, 4) NULL
);


GO

