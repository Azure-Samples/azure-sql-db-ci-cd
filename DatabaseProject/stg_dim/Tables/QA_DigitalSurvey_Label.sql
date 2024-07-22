CREATE TABLE [stg_dim].[QA_DigitalSurvey_Label] (
    [SurveyId]            NVARCHAR (50)   NULL,
    [VariableName]        NVARCHAR (50)   NOT NULL,
    [VariableId]          INT             NOT NULL,
    [VariableDescription] NVARCHAR (4000) NULL
);


GO

