CREATE TABLE [stg_dim].[QA_ServiceQuality_Answer] (
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] INT            NOT NULL,
    [AnswerId]             INT            NULL,
    [AnswerValue]          INT            NULL,
    [AnswerText]           NVARCHAR (255) NULL,
    [AnswerGroupId]        INT            NULL,
    [AnswerGroupText]      NVARCHAR (255) NULL,
    [CreatedAt]            DATETIME2 (7)  NULL,
    [ModifiedAt]           DATETIME2 (7)  NULL
);


GO

