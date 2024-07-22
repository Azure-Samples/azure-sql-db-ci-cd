CREATE TABLE [dim].[QA_ServiceQualitySurvey_ContractMeasurePoint] (
    [ContractMeasurePointKey]   INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]          INT            NOT NULL,
    [ValidToDateKey]            INT            NOT NULL,
    [IsCurrent]                 BIT            NOT NULL,
    [SourceSystemCode]          NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]       BIGINT         NOT NULL,
    [ContractCode]              NVARCHAR (20)  NOT NULL,
    [SurveyQuestionId]          BIGINT         NOT NULL,
    [Target]                    DECIMAL (9, 2) NULL,
    [MinTarget]                 DECIMAL (9, 2) NULL,
    [Importance]                DECIMAL (9, 2) NULL,
    [NytBynetPoints]            DECIMAL (9, 2) NULL,
    [NytBynet]                  INT            NULL,
    [NytBynetDataReplaceMethod] INT            NULL,
    CONSTRAINT [ContractMeasurePointKey] PRIMARY KEY CLUSTERED ([ContractMeasurePointKey] ASC, [ContractCode] ASC, [SurveyQuestionId] ASC)
);


GO

