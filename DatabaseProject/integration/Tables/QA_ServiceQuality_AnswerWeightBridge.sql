CREATE TABLE [integration].[QA_ServiceQuality_AnswerWeightBridge] (
    [SourceSystemCode]                NVARCHAR (20)  NOT NULL,
    [AnswerWeightSourceSystemEntryId] NVARCHAR (20)  NOT NULL,
    [BonusModelId]                    INT            NULL,
    [AnswerId]                        INT            NULL,
    [Weight]                          DECIMAL (6, 2) NULL,
    [Inserted]                        DATETIME2 (0)  NULL,
    [Updated]                         DATETIME2 (0)  NULL,
    [Hash]                            VARBINARY (32) NULL,
    CONSTRAINT [PK_QA_ServiceQualitySurvey_AnswerWeightBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [AnswerWeightSourceSystemEntryId] ASC)
);


GO

