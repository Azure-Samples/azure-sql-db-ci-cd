CREATE TABLE [dim].[QA_ServiceQualitySurvey_BonusSetOffParameter] (
    [BonusSetOffParametersKey] INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]         INT            NOT NULL,
    [ValidToDateKey]           INT            NOT NULL,
    [IsCurrent]                BIT            NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NOT NULL,
    [BonusSetOffModel]         NVARCHAR (255) NOT NULL,
    [MaxBonus]                 DECIMAL (9, 2) NULL,
    [MaxSetOff]                DECIMAL (9, 2) NULL,
    [LowBoundary]              INT            NULL,
    [HighBoundary]             INT            NULL,
    [ValidFromDate]            DATE           NOT NULL,
    [ValidToDate]              DATE           NOT NULL,
    CONSTRAINT [BonusSetOffParametersKey] PRIMARY KEY CLUSTERED ([BonusSetOffParametersKey] ASC, [BonusSetOffModel] ASC)
);


GO

