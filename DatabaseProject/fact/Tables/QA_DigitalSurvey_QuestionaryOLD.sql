CREATE TABLE [fact].[QA_DigitalSurvey_QuestionaryOLD] (
    [DigitalSurveyKey]       INT            IDENTITY (1, 1) NOT NULL,
    [Survey]                 INT            NOT NULL,
    [Respondent]             INT            NOT NULL,
    [VehicleNumber]          NVARCHAR (50)  NULL,
    [StartTime]              DATETIME       NULL,
    [CloseTime]              DATETIME       NULL,
    [DiffTime]               FLOAT (53)     NULL,
    [SourceCreatedDatetime]  DATETIME       NULL,
    [SourceModifiedDatetime] DATETIME       NULL,
    [VariableKey]            INT            NOT NULL,
    [LableKey]               INT            NOT NULL,
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
    [Hash]                   BINARY (32)    NULL,
    [Inserted]               DATETIME2 (7)  NULL,
    [Updated]                DATETIME2 (7)  NULL,
    [SentimentKey]           INT            NULL,
    [TrainTrackKey]          INT            NULL,
    [VariableText]           NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_QA_DigitalSurvey] PRIMARY KEY CLUSTERED ([Survey] ASC, [Respondent] ASC, [VariableKey] ASC, [LableKey] ASC)
);


GO

