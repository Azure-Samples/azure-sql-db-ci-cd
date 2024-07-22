CREATE TABLE [dim].[QA_SurveyQuestion] (
    [SurveyQuestionKey]          INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]           INT            NOT NULL,
    [ValidToDateKey]             INT            NOT NULL,
    [IsCurrent]                  BIT            NOT NULL,
    [SourceSystemCode]           NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]        BIGINT         NULL,
    [SurveyQuestionTypeId]       INT            NOT NULL,
    [SurveyQuestionTypeName]     NVARCHAR (255) NULL,
    [SurveyQuestionText]         NVARCHAR (255) NOT NULL,
    [SurveyQuestionDisplayIndex] INT            NULL,
    [SurveyQuestionDisplayName]  NVARCHAR (255) NULL,
    [IsVisible]                  BIT            NULL,
    CONSTRAINT [PK_QA_SurveyQuestion] PRIMARY KEY CLUSTERED ([SurveyQuestionKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_QA_SurveyQuestion]
    ON [dim].[QA_SurveyQuestion]([SourceSystemCode] ASC, [SourceSystemEntryId] ASC, [SurveyQuestionText] ASC);


GO

