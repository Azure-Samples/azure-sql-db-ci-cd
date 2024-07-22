CREATE TABLE [integration].[QA_DigitalSurvey_TrainNumber_Bridge] (
    [SourceSystemEntryRef] INT           NOT NULL,
    [SurveyLink]           NVARCHAR (66) NULL,
    [SurveyLinkMapping]    INT           NULL,
    [TrainNumber]          NVARCHAR (9)  NULL,
    [Garage]               NVARCHAR (8)  NULL,
    [Operator]             NVARCHAR (6)  NULL
);


GO

