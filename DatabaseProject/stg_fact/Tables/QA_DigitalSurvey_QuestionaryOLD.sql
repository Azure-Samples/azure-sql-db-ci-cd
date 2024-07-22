CREATE TABLE [stg_fact].[QA_DigitalSurvey_QuestionaryOLD] (
    [DigitalSurveyKey]       INT            IDENTITY (1, 1) NOT NULL,
    [Survey]                 INT            NULL,
    [Respondent]             INT            NULL,
    [VehicleNumber]          NVARCHAR (50)  NULL,
    [StartTime]              DATETIME       NULL,
    [CloseTime]              DATETIME       NULL,
    [DiffTime]               FLOAT (53)     NULL,
    [SourceCreatedDatetime]  DATETIME       NULL,
    [SourceModifiedDatetime] DATETIME       NULL,
    [VariableKey]            INT            NULL,
    [LableKey]               INT            NULL,
    [JourneyRef]             VARCHAR (50)   NULL,
    [LineKey]                INT            NULL,
    [LineDirectionKey]       INT            NULL,
    [FromStopPointNumber]    INT            NULL,
    [ToStopPointNumber]      INT            NULL,
    [Email]                  NVARCHAR (255) NULL,
    [StartDateKey]           INT            NULL,
    [StartTimeKey]           INT            NULL,
    [JourneyPatternKey]      INT            NULL,
    [FromStopPointKey]       INT            NULL,
    [ToStopPointKey]         INT            NULL,
    [ContractorKey]          INT            NULL,
    [Stretch]                NVARCHAR (255) NULL,
    [SentimentKey]           INT            NULL,
    [TrainTrackKey]          INT            NULL,
    [VariableText]           NVARCHAR (MAX) NULL
);


GO

