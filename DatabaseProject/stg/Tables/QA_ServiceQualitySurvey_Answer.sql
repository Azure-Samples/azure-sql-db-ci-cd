CREATE TABLE [stg].[QA_ServiceQualitySurvey_Answer] (
    [FileId]                  INT           NULL,
    [SourceSystemCode]        NVARCHAR (20) NOT NULL,
    [SourceSystemEntryId]     VARCHAR (255) NULL,
    [InterviewerId]           VARCHAR (255) NULL,
    [DateTime]                DATETIME      NULL,
    [Line]                    VARCHAR (255) NULL,
    [ContractorName]          VARCHAR (255) NULL,
    [BusNo]                   VARCHAR (255) NULL,
    [InterviewId]             VARCHAR (255) NULL,
    [StartStopNo]             VARCHAR (255) NULL,
    [EndStopNo]               VARCHAR (255) NULL,
    [RespondentId]            VARCHAR (255) NULL,
    [QuestionText]            VARCHAR (255) NULL,
    [AnswerValue]             VARCHAR (255) NULL,
    [ValidFlag]               BIT           CONSTRAINT [DF_QA_ServiceQualitySurvey_Answer_ValidFlag] DEFAULT ((0)) NULL,
    [DataQualityType]         SMALLINT      NULL,
    [InterviewTypeId]         VARCHAR (255) CONSTRAINT [DF_QA_ServiceQualitySurvey_Answer_InterviewTypeId] DEFAULT ((-1)) NULL,
    [InterviewStartLatitude]  VARCHAR (255) CONSTRAINT [DF_QA_ServiceQualitySurvey_Answer_InterviewStartPointLatitude] DEFAULT ((-1)) NULL,
    [InterviewStartLongitude] VARCHAR (255) CONSTRAINT [DF_QA_ServiceQualitySurvey_Answer_InterviewStartPointLongitude] DEFAULT ((-1)) NULL,
    [FileModifyDateTime]      DATETIME2 (0) NULL
);


GO

