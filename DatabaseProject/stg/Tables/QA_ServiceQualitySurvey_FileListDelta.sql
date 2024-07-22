CREATE TABLE [stg].[QA_ServiceQualitySurvey_FileListDelta] (
    [FileListDeltaID]  INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode] NVARCHAR (255) NULL,
    [FileName]         NVARCHAR (255) NULL,
    [ChangeDateTime]   DATETIME       NULL
);


GO

