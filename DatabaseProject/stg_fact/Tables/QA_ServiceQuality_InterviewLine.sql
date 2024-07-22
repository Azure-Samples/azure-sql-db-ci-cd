CREATE TABLE [stg_fact].[QA_ServiceQuality_InterviewLine] (
    [SourceSystemCode]     NVARCHAR (10)  NULL,
    [SourceSystemEntryRef] NVARCHAR (100) NULL,
    [InterviewId]          BIGINT         NULL,
    [RespondentId]         BIGINT         NULL,
    [QuestionId]           BIGINT         NULL,
    [QuestionKey]          INT            NULL,
    [AnswerGroupId]        INT            NULL,
    [AnswerKey]            INT            NULL,
    [AnswerValue]          BIGINT         NULL,
    [Target]               DECIMAL (9, 2) NULL,
    [MinTarget]            DECIMAL (9, 2) NULL,
    [Importance]           DECIMAL (9, 2) NULL,
    [Weight]               DECIMAL (6, 3) NULL,
    [ModifiedAt]           DATETIME2 (0)  NULL,
    [IsZeroed]             BIT            NULL,
    [IsDeleted]            BIT            NULL
);


GO

