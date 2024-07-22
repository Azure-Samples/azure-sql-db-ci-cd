CREATE TABLE [dim].[QA_ServiceQuality_BonusModel] (
    [BonusModelKey]        INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] BIGINT         NULL,
    [BonusModelId]         INT            NULL,
    [BonusModelName]       NVARCHAR (255) NULL,
    [MaxBonus]             DECIMAL (9, 2) NULL,
    [MaxPenalty]           DECIMAL (9, 2) NULL,
    [LowBoundary]          INT            NULL,
    [HighBoundary]         INT            NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQuality_BonusModel_Merge]
    ON [dim].[QA_ServiceQuality_BonusModel]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([BonusModelName], [MaxBonus], [MaxPenalty], [LowBoundary], [HighBoundary]);


GO

