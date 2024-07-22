CREATE TABLE [dim].[QA_ServiceQualitySurvey_StopPointFacilityManagement] (
    [StopPointFacilityManagementKey]   INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]                 INT            NULL,
    [ValidToDateKey]                   INT            NULL,
    [JourneyPatternPointGid]           BIGINT         NULL,
    [StopPointTypeCode]                NVARCHAR (20)  NULL,
    [StopPointName]                    NVARCHAR (250) NULL,
    [StopPointNumber]                  INT            NULL,
    [StopPointDisplayName]             NVARCHAR (250) NULL,
    [StopAreaName]                     NVARCHAR (250) NULL,
    [StopAreaAbbreviation]             NVARCHAR (10)  NULL,
    [MunicipalityDisplayName]          NVARCHAR (250) NULL,
    [FacilityManagmentResponsibleName] NVARCHAR (250) NULL,
    [ValidFromDate]                    DATE           NULL,
    [ValidToDate]                      DATE           NULL,
    [IsCurrent]                        BIT            NULL,
    [ChangeDateTime]                   DATETIME       NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_StopPointFacilityManagement] PRIMARY KEY NONCLUSTERED ([StopPointFacilityManagementKey] ASC)
);


GO

