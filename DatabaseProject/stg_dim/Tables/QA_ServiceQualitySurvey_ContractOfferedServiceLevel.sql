CREATE TABLE [stg_dim].[QA_ServiceQualitySurvey_ContractOfferedServiceLevel] (
    [ContractOfferedServiceLevelKey] INT            NULL,
    [OfferedServiceLevel]            DECIMAL (9, 2) NULL,
    [ContractCode]                   NVARCHAR (20)  NULL,
    [SourceSystemEntryId]            BIGINT         NULL,
    [SourceSystemCode]               NVARCHAR (20)  NOT NULL
);


GO

