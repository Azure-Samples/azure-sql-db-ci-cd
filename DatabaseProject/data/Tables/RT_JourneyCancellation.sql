CREATE TABLE [data].[RT_JourneyCancellation] (
    [JourneyRef]                          CHAR (18)          NOT NULL,
    [SourceSystemCode]                    NVARCHAR (20)      NOT NULL,
    [SourceSystemEntryRef]                BIGINT             NOT NULL,
    [OperationActionTypeCode]             NVARCHAR (20)      NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50)      NULL,
    [DeviationReasonCustomCategoryCode]   NVARCHAR (50)      NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50)      NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20)      NULL,
    [CreatedUtcDateTime]                  DATETIME2 (3)      NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3)      NULL,
    [RegistrationDateTime]                DATETIMEOFFSET (3) NULL,
    [RevokedDateTime]                     DATETIMEOFFSET (3) NULL,
    [ReportedByUserName]                  NVARCHAR (100)     NULL,
    CONSTRAINT [PK_RT_JourneyCancellation] PRIMARY KEY CLUSTERED ([JourneyRef] ASC, [SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

