CREATE TABLE [stg_fact].[QA_DigitalSurvey_Questionary] (
    [SourceSystemCode]     NVARCHAR (30)   NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (100)  NOT NULL,
    [JourneyRef]           VARCHAR (50)    NULL,
    [JourneyPatternKey]    INT             NULL,
    [Survey]               INT             NOT NULL,
    [Respondent]           INT             NOT NULL,
    [ContractorCode]       NVARCHAR (10)   NULL,
    [ContractorKey]        INT             NULL,
    [VehicleNumber]        NVARCHAR (50)   NULL,
    [VehicleKey]           INT             NULL,
    [TrainTrack]           NVARCHAR (100)  NULL,
    [TrainStation]         NVARCHAR (100)  NULL,
    [TrainStationKey]      INT             NULL,
    [LineNumber]           INT             NULL,
    [LineDirectionKey]     INT             NULL,
    [FromStopPointNumber]  INT             NULL,
    [FromStopPointKey]     INT             NULL,
    [ToStopPointNumber]    INT             NULL,
    [ToStopPointKey]       INT             NULL,
    [StartTime]            DATETIME2 (0)   NULL,
    [StartDateKey]         INT             NULL,
    [StartTimeKey]         INT             NULL,
    [CloseTime]            DATETIME2 (0)   NULL,
    [CloseTimeKey]         INT             NULL,
    [VariableId]           NVARCHAR (4000) NULL,
    [VariableName]         VARCHAR (50)    NOT NULL,
    [VariableKey]          INT             NULL,
    [Lable]                NVARCHAR (50)   NULL,
    [LableKey]             INT             NULL,
    [VariableValue]        NVARCHAR (4000) NULL,
    [DiffTime]             NUMERIC (18)    NULL,
    [TransPortMode]        NVARCHAR (10)   NULL,
    [QuestionaryState]     SMALLINT        NULL
);


GO

