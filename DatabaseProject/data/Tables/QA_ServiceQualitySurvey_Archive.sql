CREATE TABLE [data].[QA_ServiceQualitySurvey_Archive] (
    [SourceSystemCode]        NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]     NVARCHAR (110) NULL,
    [Filename]                NVARCHAR (100) NOT NULL,
    [FileModifyDateTime]      DATETIME2 (0)  NULL,
    [DataSupplier]            NVARCHAR (30)  NOT NULL,
    [InterviewerId]           VARCHAR (255)  NULL,
    [InterviewDateTime]       DATETIME2 (0)  NULL,
    [Line]                    VARCHAR (255)  NULL,
    [ContractorName]          VARCHAR (255)  NULL,
    [BusNo]                   VARCHAR (255)  NULL,
    [InterviewId]             VARCHAR (255)  NULL,
    [StartStopNo]             VARCHAR (255)  NULL,
    [EndStopNo]               VARCHAR (255)  NULL,
    [RespondentId]            VARCHAR (255)  NULL,
    [QuestionText]            VARCHAR (255)  NULL,
    [AnswerValue]             VARCHAR (255)  NULL,
    [InterviewStartLatitude]  VARCHAR (255)  NULL,
    [InterviewStartLongitude] VARCHAR (255)  NULL,
    [InterviewTypeId]         VARCHAR (255)  NULL
);


GO

