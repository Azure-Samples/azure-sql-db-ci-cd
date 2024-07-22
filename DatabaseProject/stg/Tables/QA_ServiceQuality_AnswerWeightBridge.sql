CREATE TABLE [stg].[QA_ServiceQuality_AnswerWeightBridge] (
    [SourceSystemCode]                NVARCHAR (20)  NOT NULL,
    [AnswerWeightSourceSystemEntryId] NVARCHAR (20)  NULL,
    [BonusModelId]                    INT            NULL,
    [AnswerId]                        INT            NULL,
    [Weight]                          DECIMAL (6, 2) NULL
);


GO

