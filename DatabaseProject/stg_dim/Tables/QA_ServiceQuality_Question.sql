CREATE TABLE [stg_dim].[QA_ServiceQuality_Question] (
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] BIGINT         NULL,
    [QuestionId]           INT            NOT NULL,
    [QuestionTextAlt1]     NVARCHAR (255) NULL,
    [QuestionTextAlt2]     NVARCHAR (255) NULL,
    [QuestionIndex]        INT            NULL,
    [IsVisible]            BIT            NULL,
    [QuestionTypeId]       INT            NOT NULL,
    [QuestionTypeName]     NVARCHAR (255) NULL,
    [CreatedAt]            DATETIME2 (0)  NULL,
    [ModifiedAt]           DATETIME2 (0)  NULL
);


GO

