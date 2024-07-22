CREATE TABLE [stg_dim].[QA_SurveyQuestion] (
    [SurveyQuestionKey]          INT            NULL,
    [IsCurrent]                  BIT            NULL,
    [SourceSystemCode]           NVARCHAR (20)  NULL,
    [SourceSystemEntryId]        BIGINT         NULL,
    [SurveyQuestionTypeId]       INT            NULL,
    [SurveyQuestionTypeName]     NVARCHAR (255) NULL,
    [SurveyQuestionText]         NVARCHAR (255) NULL,
    [SurveyQuestionDisplayIndex] INT            NULL,
    [SurveyQuestionDisplayName]  NVARCHAR (255) NULL,
    [ValidFromDate]              DATE           NULL,
    [ValidToDate]                DATE           NULL,
    [IsVisible]                  BIT            NULL
);


GO

