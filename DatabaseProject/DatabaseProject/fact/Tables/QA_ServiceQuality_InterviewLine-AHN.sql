CREATE TABLE [fact].[QA_ServiceQuality_InterviewLine-AHN] (
    [SourceSystemCode]     NVARCHAR (10)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NOT NULL,
    [InterviewId]          BIGINT         NULL,
    [QuestionKey]          INT            NULL,
    [AnswerKey]            INT            NULL,
    [AnswerValue]          BIGINT         NULL,
    [Target]               DECIMAL (9, 2) NULL,
    [MinTarget]            DECIMAL (9, 2) NULL,
    [Importance]           DECIMAL (9, 2) NULL,
    [Weight]               DECIMAL (6, 3) NULL,
    [IsZeroed]             BIT            NULL,
    [IsDeleted]            BIT            NULL,
    [ModifiedAt]           DATETIME2 (0)  NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_ServiceQuality_InterviewLine-AHN] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

