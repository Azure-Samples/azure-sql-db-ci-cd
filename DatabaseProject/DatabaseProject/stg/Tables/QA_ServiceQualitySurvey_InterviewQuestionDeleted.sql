CREATE TABLE [stg].[QA_ServiceQualitySurvey_InterviewQuestionDeleted] (
    [InterviewId]        BIGINT   NOT NULL,
    [RespondentId]       BIGINT   NOT NULL,
    [QuestionId]         BIGINT   NOT NULL,
    [SurveyQuestionType] BIGINT   NULL,
    [AnswerValue]        BIGINT   NOT NULL,
    [ModifiedAt]         DATETIME NOT NULL,
    [IsZeroed]           INT      NULL
);


GO

