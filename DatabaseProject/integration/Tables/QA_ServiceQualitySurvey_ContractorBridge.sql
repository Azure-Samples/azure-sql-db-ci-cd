CREATE TABLE [integration].[QA_ServiceQualitySurvey_ContractorBridge] (
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] NVARCHAR (250) NOT NULL,
    [ContractorCode]      NVARCHAR (20)  NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_ContractorBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

