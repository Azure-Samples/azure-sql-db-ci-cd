CREATE TABLE [stg].[QA_ServiceQualitySurvey_FileListArrival] (
    [FileListArrivalID]  INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]   NVARCHAR (255) NULL,
    [FileName]           NVARCHAR (255) NULL,
    [FileModifyDateTime] DATETIME2 (0)  NULL,
    [ChangeDateTime]     DATETIME       NULL
);


GO

