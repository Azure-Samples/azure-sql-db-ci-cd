CREATE TABLE [dim].[QA_ServiceQuality_Question] (
    [QuestionKey]          INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] INT            NOT NULL,
    [QuestionId]           INT            NOT NULL,
    [QuestionIndex]        INT            NULL,
    [QuestionTextAlt1]     NVARCHAR (255) NOT NULL,
    [QuestionTextAlt2]     NVARCHAR (255) NOT NULL,
    [QuestionTypeId]       INT            NOT NULL,
    [QuestionTypeName]     NVARCHAR (255) NOT NULL,
    [IsVisible]            BIT            NULL,
    [CreatedAt]            DATETIME2 (0)  NOT NULL,
    [ModifiedAt]           DATETIME2 (0)  NOT NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_Question] PRIMARY KEY CLUSTERED ([QuestionKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_ServiceQuality_Question_Merge]
    ON [dim].[QA_ServiceQuality_Question]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([QuestionKey], [QuestionIndex], [QuestionTypeName], [QuestionTypeId], [QuestionTextAlt1], [CreatedAt], [ModifiedAt]);


GO

