CREATE TABLE [dim].[QA_ServiceQuality_Answer] (
    [AnswerKey]            INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] INT            NOT NULL,
    [AnswerId]             INT            NULL,
    [AnswerValue]          INT            NULL,
    [AnswerText]           NVARCHAR (255) NULL,
    [AnswerGroupId]        INT            NULL,
    [AnswerGroupText]      NVARCHAR (255) NULL,
    [CreatedAt]            DATETIME2 (7)  NULL,
    [ModifiedAt]           DATETIME2 (7)  NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_Answer] PRIMARY KEY CLUSTERED ([AnswerKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQuality_Answer_Merge]
    ON [dim].[QA_ServiceQuality_Answer]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([AnswerGroupId], [AnswerId], [AnswerValue], [AnswerText], [CreatedAt], [ModifiedAt]);


GO

