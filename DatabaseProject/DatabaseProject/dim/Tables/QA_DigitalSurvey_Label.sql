CREATE TABLE [dim].[QA_DigitalSurvey_Label] (
    [SurveyId]            NVARCHAR (50)   NOT NULL,
    [VariableName]        NVARCHAR (50)   NOT NULL,
    [VariableId]          INT             NOT NULL,
    [VariableDescription] NVARCHAR (4000) NULL,
    [ValidFromDate]       DATE            NULL,
    [ValidToDate]         DATE            NULL,
    [IsCurrent]           BIT             NULL,
    [LableKey]            INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_Label] PRIMARY KEY CLUSTERED ([LableKey] ASC)
);


GO

