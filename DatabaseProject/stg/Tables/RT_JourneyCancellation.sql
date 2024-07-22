CREATE TABLE [stg].[RT_JourneyCancellation] (
    [JourneyRef]                          CHAR (18)          NULL,
    [SourceSystemCode]                    NVARCHAR (20)      NULL,
    [SourceSystemEntryRef]                BIGINT             NULL,
    [OperationActionTypeCode]             NVARCHAR (20)      NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50)      NULL,
    [DeviationReasonCustomCategoryCode]   NVARCHAR (50)      NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50)      NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20)      NULL,
    [CreatedUtcDateTime]                  DATETIME2 (3)      NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3)      NULL,
    [RegistrationDateTime]                DATETIMEOFFSET (3) NULL,
    [RevokedDateTime]                     DATETIMEOFFSET (3) NULL,
    [ReportedByUserName]                  NVARCHAR (100)     NULL
);


GO

