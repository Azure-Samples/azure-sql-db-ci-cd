CREATE TABLE [stg].[QA_ServiceQualitySurvey_Quota] (
    [ContractCode]  NVARCHAR (20)  CONSTRAINT [DF_QA_ServiceQualitySurvey_Quota_ContractCode] DEFAULT (NULL) NULL,
    [ContractName]  NVARCHAR (255) NULL,
    [Contractor]    NVARCHAR (255) NULL,
    [TenderCode]    NVARCHAR (255) NULL,
    [ContractUnit]  NVARCHAR (255) NULL,
    [Quota]         INT            NULL,
    [ValidFromDate] DATETIME       NULL,
    [ValidToDate]   DATETIME       NULL
);


GO

