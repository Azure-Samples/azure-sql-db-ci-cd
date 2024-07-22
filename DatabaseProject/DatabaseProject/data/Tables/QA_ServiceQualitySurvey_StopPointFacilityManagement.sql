CREATE TABLE [data].[QA_ServiceQualitySurvey_StopPointFacilityManagement] (
    [StopPointFacilityManagementId]    INT            IDENTITY (1, 1) NOT NULL,
    [JourneyPatternPointGid]           BIGINT         NULL,
    [StopPointTypeCode]                NVARCHAR (20)  NULL,
    [StopPointName]                    NVARCHAR (250) NULL,
    [StopPointNumber]                  INT            NULL,
    [StopPointDisplayName]             NVARCHAR (250) NULL,
    [StopAreaName]                     NVARCHAR (250) NULL,
    [StopAreaAbbreviation]             NVARCHAR (10)  NULL,
    [MunicipalityDisplayName]          NVARCHAR (250) NULL,
    [FacilityManagmentResponsibleName] NVARCHAR (250) NULL,
    [FutureValidFromDate]              DATE           NULL,
    [OngoingSurveySupplierName]        NVARCHAR (250) NULL,
    [OngoingSurveyStartDate]           DATE           NULL,
    [NextSurveySupplierName]           NVARCHAR (250) NULL,
    [NextSurveyStartDate]              DATE           NULL,
    [NeedsAttention]                   NVARCHAR (3)   NULL,
    [Acceptance]                       NVARCHAR (3)   NULL,
    [ChangeDateTime]                   DATETIME       NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_StopPointFacilityManagement] PRIMARY KEY NONCLUSTERED ([StopPointFacilityManagementId] ASC)
);


GO

