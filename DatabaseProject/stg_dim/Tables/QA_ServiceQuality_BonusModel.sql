CREATE TABLE [stg_dim].[QA_ServiceQuality_BonusModel] (
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] BIGINT         NULL,
    [BonusModelId]         INT            NULL,
    [BonusModelName]       NVARCHAR (255) NULL,
    [MaxBonus]             DECIMAL (9, 2) NULL,
    [MaxPenalty]           DECIMAL (9, 2) NULL,
    [LowBoundary]          INT            NULL,
    [HighBoundary]         INT            NULL
);


GO

