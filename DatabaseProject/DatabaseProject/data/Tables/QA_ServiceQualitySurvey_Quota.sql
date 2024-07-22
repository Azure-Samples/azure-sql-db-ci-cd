CREATE TABLE [data].[QA_ServiceQualitySurvey_Quota] (
    [ContractCode]  NVARCHAR (20)  NOT NULL,
    [ContractName]  NVARCHAR (255) NULL,
    [Contractor]    NVARCHAR (255) NULL,
    [TenderCode]    NVARCHAR (255) NULL,
    [ContractUnit]  NVARCHAR (255) NULL,
    [Quota]         INT            NULL,
    [ValidFromDate] DATETIME       NOT NULL,
    [ValidToDate]   DATETIME       NULL,
    CONSTRAINT [pk_QA_ServiceQualitySurvey_Quota] PRIMARY KEY CLUSTERED ([ContractCode] ASC, [ValidFromDate] ASC)
);


GO

