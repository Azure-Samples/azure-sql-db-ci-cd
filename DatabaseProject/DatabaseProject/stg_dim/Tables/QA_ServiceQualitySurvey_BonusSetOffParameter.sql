CREATE TABLE [stg_dim].[QA_ServiceQualitySurvey_BonusSetOffParameter] (
    [BonusSetOffParametersKey] INT            NULL,
    [ValidFromDateKey]         INT            NULL,
    [ValidToDateKey]           INT            NULL,
    [IsCurrent]                BIT            NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NULL,
    [BonusSetOffModel]         NVARCHAR (255) NULL,
    [MaxBonus]                 DECIMAL (9, 2) NULL,
    [MaxSetOff]                DECIMAL (9, 2) NULL,
    [LowBoundary]              INT            NULL,
    [HighBoundary]             INT            NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL
);


GO

