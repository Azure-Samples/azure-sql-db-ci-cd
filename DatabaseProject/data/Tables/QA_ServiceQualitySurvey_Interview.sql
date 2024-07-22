CREATE TABLE [data].[QA_ServiceQualitySurvey_Interview] (
    [Id]                     BIGINT         NOT NULL,
    [SourceFileName]         NVARCHAR (255) NOT NULL,
    [InterviewerId]          BIGINT         NULL,
    [RespondentId]           BIGINT         NOT NULL,
    [Time]                   DATETIME       NULL,
    [Age]                    INT            NULL,
    [Gender]                 NVARCHAR (20)  NULL,
    [LineNumber]             INT            NULL,
    [VehicleRef]             INT            NOT NULL,
    [ContractorCode]         NVARCHAR (20)  NULL,
    [GarageCode]             NVARCHAR (20)  NULL,
    [ContractCode]           NVARCHAR (20)  NULL,
    [DurationInMinutes]      INT            NULL,
    [Purpose]                INT            NULL,
    [Frequency]              INT            NULL,
    [Placement]              INT            NULL,
    [Language]               INT            NULL,
    [FromStopPointId]        INT            NULL,
    [InterviewerStartStopId] INT            NULL,
    [InterviewerEndStopId]   INT            NULL,
    [StartLongitude]         DECIMAL (8, 6) NULL,
    [StartLatitude]          DECIMAL (8, 6) NULL,
    [ModifiedAt]             DATETIME       NOT NULL,
    [DatedVehicleJourneyId]  BIGINT         NULL,
    [JourneyRef]             CHAR (18)      NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_Interview] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

