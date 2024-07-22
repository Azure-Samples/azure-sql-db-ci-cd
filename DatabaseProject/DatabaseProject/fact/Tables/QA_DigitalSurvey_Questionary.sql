CREATE TABLE [fact].[QA_DigitalSurvey_Questionary] (
    [SourceSystemCode]     NVARCHAR (30)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NOT NULL,
    [JourneyRef]           VARCHAR (50)   NULL,
    [JourneyPatternKey]    INT            NULL,
    [Survey]               INT            NULL,
    [Respondent]           INT            NULL,
    [ContractorKey]        INT            NULL,
    [VehicleKey]           INT            NULL,
    [TrainStationKey]      INT            NULL,
    [LineDirectionKey]     INT            NULL,
    [FromStopPointKey]     INT            NULL,
    [ToStopPointKey]       INT            NULL,
    [StartDateKey]         INT            NULL,
    [StartTimeKey]         INT            NULL,
    [CloseTimeKey]         INT            NULL,
    [VariableKey]          INT            NULL,
    [LableKey]             INT            NULL,
    [DiffTime]             NUMERIC (18)   NULL,
    [TransPortMode]        NVARCHAR (10)  NULL,
    [QuestionaryState]     SMALLINT       NULL,
    [Inserted]             DATETIME2 (0)  NULL,
    [Updated]              DATETIME2 (0)  NULL,
    [Hash]                 BINARY (32)    NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_Questionary] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

