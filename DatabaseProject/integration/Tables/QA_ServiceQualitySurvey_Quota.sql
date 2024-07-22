CREATE TABLE [integration].[QA_ServiceQualitySurvey_Quota] (
    [ContractCode]  NVARCHAR (20)  NOT NULL,
    [ContractName]  NVARCHAR (255) NULL,
    [Contractor]    NVARCHAR (255) NULL,
    [TenderCode]    NVARCHAR (255) NULL,
    [ContractUnit]  NVARCHAR (255) NULL,
    [Quota]         INT            NULL,
    [ValidFromDate] DATETIME       NOT NULL,
    [ValidToDate]   DATETIME       CONSTRAINT [DF_QA_ServiceQualitySurvey_Quota_ValidToDate] DEFAULT (NULL) NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_Quota_1] PRIMARY KEY CLUSTERED ([ContractCode] ASC)
);


GO

