CREATE TABLE [stg].[QA_ServiceQualitySurvey_StopPointFacilityManagement] (
    [StopPointFacilityManagementId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [JourneyPatternPointGid]           NVARCHAR (255) NULL,
    [StopPointTypeCode]                NVARCHAR (255) NULL,
    [StopPointName]                    NVARCHAR (255) NULL,
    [StopPointNumber]                  FLOAT (53)     NULL,
    [StopPointDisplayName]             NVARCHAR (255) NULL,
    [StopAreaName]                     NVARCHAR (255) NULL,
    [StopAreaAbbreviation]             NVARCHAR (255) NULL,
    [MunicipalityDisplayName]          NVARCHAR (255) NULL,
    [FacilityManagmentResponsibleName] NVARCHAR (255) NULL,
    [FutureValidFromDate]              DATE           NULL,
    [OngoingSurveySupplierName]        NVARCHAR (255) NULL,
    [OngoingSurveyStartDate]           DATE           NULL,
    [NextSurveySupplierName]           NVARCHAR (255) NULL,
    [NextSurveyStartDate]              DATE           NULL,
    [NeedsAttention]                   NVARCHAR (255) NULL,
    [Acceptance]                       NVARCHAR (255) NULL,
    [ChangeDateTime]                   DATETIME       NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_StopPointFacilityManagement] PRIMARY KEY NONCLUSTERED ([StopPointFacilityManagementId] ASC)
);


GO

