CREATE TABLE [fact].[QA_ServiceQualitySurvey] (
    [Id]                        BIGINT          NOT NULL,
    [InterviewerId]             BIGINT          NULL,
    [RespondentId]              BIGINT          NOT NULL,
    [Time]                      DATETIME        NULL,
    [DateKey]                   INT             NULL,
    [VehicleRef]                INT             NOT NULL,
    [Age]                       INT             NULL,
    [Gender]                    NVARCHAR (20)   NULL,
    [DurationInMinutes]         INT             NULL,
    [Purpose]                   INT             NULL,
    [Frequency]                 INT             NULL,
    [Placement]                 INT             NULL,
    [Language]                  INT             NULL,
    [JourneyRef]                CHAR (18)       NULL,
    [FromStopPointId]           INT             NULL,
    [InterviewerStartStopKey]   INT             NULL,
    [InterviewerEndStopKey]     INT             NULL,
    [LineKey]                   INT             NOT NULL,
    [LineDisplayName]           NVARCHAR (250)  NULL,
    [SurveyQuestionKey]         INT             NOT NULL,
    [SurveyAnswerKey]           INT             NOT NULL,
    [AnswerValue]               BIGINT          NOT NULL,
    [Weight]                    DECIMAL (18, 4) NULL,
    [ContractKey]               INT             NOT NULL,
    [ContractName]              NVARCHAR (250)  NULL,
    [ContractorKey]             INT             NOT NULL,
    [ContractorName]            NVARCHAR (250)  NULL,
    [GarageKey]                 INT             NOT NULL,
    [Target]                    DECIMAL (9, 2)  NULL,
    [MinTarget]                 DECIMAL (9, 2)  NULL,
    [Importance]                DECIMAL (9, 2)  NULL,
    [NytBynetPoints]            DECIMAL (9, 2)  NULL,
    [NytBynet]                  INT             NULL,
    [NytBynetDataReplaceMethod] INT             NULL,
    [MaxBonus]                  DECIMAL (9, 2)  NULL,
    [MaxSetOff]                 DECIMAL (9, 2)  NULL,
    [LowBoundary]               INT             NULL,
    [HighBoundary]              INT             NULL,
    [MeasuringPeriod]           NVARCHAR (255)  NOT NULL,
    [ValidFromDate]             DATE            NOT NULL,
    [ValidToDate]               DATE            NOT NULL,
    [NonNytBynetPeriodStart]    DATE            NULL,
    [NonNytBynetPeriodEnd]      DATE            NULL,
    [NytBynetWeight]            INT             NULL,
    [IsZeroed]                  INT             NULL,
    [MeasuringPeriodKey]        INT             CONSTRAINT [DF_QA_ServiceQualitySurvey_MeasuringPeriodKey] DEFAULT ((-1)) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey] PRIMARY KEY CLUSTERED ([RespondentId] ASC, [SurveyQuestionKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQualitySurvey_Update]
    ON [fact].[QA_ServiceQualitySurvey]([RespondentId] ASC, [DateKey] ASC, [SurveyQuestionKey] ASC);


GO

CREATE COLUMNSTORE INDEX [CSIX_QA_ServiceQualitySurvey]
    ON [fact].[QA_ServiceQualitySurvey]([InterviewerId], [DateKey], [MeasuringPeriodKey], [Purpose], [LineKey], [SurveyQuestionKey], [VehicleRef], [Age], [Gender], [DurationInMinutes], [MinTarget], [Importance], [Placement], [Language], [InterviewerStartStopKey], [InterviewerEndStopKey], [HighBoundary], [IsZeroed], [SurveyAnswerKey], [ContractKey], [ContractorKey], [GarageKey], [Frequency], [MeasuringPeriod], [NytBynetPoints], [NytBynet], [MaxSetOff], [LowBoundary]);


GO

