CREATE TABLE [stg_dim].[QA_ServiceQualitySurvey_ContractMeasurePoint] (
    [ContractMeasurePointKey]   INT            NULL,
    [ValidFromDateKey]          INT            NULL,
    [ValidToDateKey]            INT            NULL,
    [IsCurrent]                 BIT            NULL,
    [SourceSystemCode]          NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]       BIGINT         NULL,
    [ContractCode]              NVARCHAR (20)  NULL,
    [SurveyQuestionId]          BIGINT         NULL,
    [Target]                    DECIMAL (9, 2) NULL,
    [MinTarget]                 DECIMAL (9, 2) NULL,
    [Importance]                DECIMAL (9, 2) NULL,
    [NytBynetPoints]            DECIMAL (9, 2) NULL,
    [NytBynet]                  INT            NULL,
    [NytBynetDataReplaceMethod] INT            NULL
);


GO

