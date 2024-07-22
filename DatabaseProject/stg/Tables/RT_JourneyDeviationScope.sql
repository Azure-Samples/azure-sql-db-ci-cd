CREATE TABLE [stg].[RT_JourneyDeviationScope] (
    [SourceSystemCode]                    NVARCHAR (20)      NULL,
    [SourceSystemEntryRef]                NVARCHAR (20)      NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50)      NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20)      NULL,
    [DeviationCaseGid]                    NUMERIC (16)       NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (20)      NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (50)      NULL,
    [OperationActionTypeCode]             NVARCHAR (20)      NULL,
    [CreatedUtcDateTime]                  DATETIME2 (3)      NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3)      NULL,
    [DatedVehicleJourneyGid]              NUMERIC (16)       NULL,
    [FromDateTime]                        DATETIMEOFFSET (3) NULL,
    [UptoDateTime]                        DATETIMEOFFSET (3) NULL,
    [RegistrationDateTime]                DATETIMEOFFSET (3) NULL,
    [RevokedDateTime]                     DATETIMEOFFSET (3) NULL,
    [IsReplacedById]                      NVARCHAR (20)      NULL,
    [OrganisationCode]                    NVARCHAR (50)      NULL,
    [ReportedByUserName]                  NVARCHAR (100)     NULL,
    [SourceNote]                          NVARCHAR (255)     NULL
);


GO

