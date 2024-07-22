CREATE TABLE [data].[QA_DigitalSurvey_QuestionaryUnpivot] (
    [SourceSystemCode]       NVARCHAR (30)   NOT NULL,
    [SourceSystemEntryRef]   NVARCHAR (100)  NOT NULL,
    [Survey]                 INT             NOT NULL,
    [Respondent]             INT             NOT NULL,
    [ContractorCode]         NVARCHAR (10)   NULL,
    [CoverId]                NVARCHAR (50)   NULL,
    [VehicleNumber]          INT             NULL,
    [StartTime]              DATETIME        NULL,
    [CloseTime]              DATETIME        NULL,
    [DiffTime]               FLOAT (53)      NULL,
    [SourceCreatedDatetime]  DATETIME        NULL,
    [SourceModifiedDatetime] DATETIME        NULL,
    [VariableName]           VARCHAR (50)    NOT NULL,
    [VariableDescription]    NVARCHAR (4000) NULL,
    [VariableId]             NVARCHAR (4000) NULL,
    [VariableValue]          NVARCHAR (4000) NULL,
    [JourneyRef]             VARCHAR (50)    NULL,
    [LineNumber]             INT             NULL,
    [LineDesignation]        VARCHAR (50)    NULL,
    [LineDirectionName]      NVARCHAR (255)  NULL,
    [FromPoint]              INT             NULL,
    [FromName]               NVARCHAR (255)  NULL,
    [ToPoint]                INT             NULL,
    [ToName]                 NVARCHAR (255)  NULL,
    [Email]                  NVARCHAR (255)  NULL,
    [TrainTrack]             NVARCHAR (250)  NULL,
    [Stop]                   NVARCHAR (250)  NULL,
    [TransPortMode]          NVARCHAR (10)   NULL,
    [QuestionaryState]       SMALLINT        NULL,
    [Inserted]               DATETIME2 (7)   NULL,
    [Updated]                DATETIME2 (7)   NULL,
    [Hash]                   BINARY (32)     NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_QuestionaryUnpivot] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

