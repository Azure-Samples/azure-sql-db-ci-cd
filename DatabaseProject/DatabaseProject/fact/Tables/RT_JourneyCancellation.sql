CREATE TABLE [fact].[RT_JourneyCancellation] (
    [JourneyCancellationKey]              BIGINT             IDENTITY (1, 1) NOT NULL,
    [DeviationStandardReasonKey]          INT                NOT NULL,
    [DeviationCustomReasonKey]            INT                NOT NULL,
    [DateKey]                             INT                NULL,
    [ContractKey]                         INT                NULL,
    [ContractorKey]                       INT                NULL,
    [JourneyPatternKey]                   INT                NULL,
    [LineKey]                             INT                NULL,
    [JourneyCancellationCodeKey]          INT                NULL,
    [JourneyRef]                          VARCHAR (18)       NULL,
    [SourceSystemCode]                    NVARCHAR (20)      NULL,
    [SourceSystemEntryRef]                BIGINT             NOT NULL,
    [SourceSystemDeviationCaseRef]        NVARCHAR (20)      NULL,
    [ContractCode]                        NVARCHAR (20)      NULL,
    [ContractorCode]                      NVARCHAR (20)      NULL,
    [ContractorGarageCode]                NVARCHAR (20)      NULL,
    [LineNumber]                          INT                NULL,
    [JourneyNumber]                       INT                NULL,
    [JourneyPatternId]                    NUMERIC (16)       NULL,
    [ExternalSourceSystemCode]            NVARCHAR (50)      NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50)      NULL,
    [DeviationReasonCustomCategoryCode]   NVARCHAR (50)      NULL,
    [OperationActionTypeCode]             NVARCHAR (50)      NULL,
    [OperatingDayDate]                    DATE               NULL,
    [CreatedUtcDateTime]                  DATETIME2 (3)      NULL,
    [LastModifiedUtcDateTime]             DATETIME2 (3)      NULL,
    [RegistrationDateTime]                DATETIMEOFFSET (3) NULL,
    [RevokedDateTime]                     DATETIMEOFFSET (3) NULL,
    [FirstStopCancelled]                  INT                NULL,
    [LastStopCancelled]                   INT                NULL,
    [TotalStopCancelled]                  INT                NULL,
    [TotalStop]                           INT                NULL,
    [FirstStopCancelledName]              NVARCHAR (100)     NULL,
    [LastStopCancelledName]               NVARCHAR (100)     NULL,
    [ReportedByUserName]                  NVARCHAR (100)     NULL,
    CONSTRAINT [PK_RT_JourneyCancellation_] PRIMARY KEY CLUSTERED ([JourneyCancellationKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_JourneyCancellation_SourceSystemEnteryRef]
    ON [fact].[RT_JourneyCancellation]([SourceSystemEntryRef] ASC, [SourceSystemDeviationCaseRef] ASC);


GO

