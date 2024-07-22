CREATE TABLE [dim].[QA_InterviewType] (
    [InterviewTypeKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]         INT            NOT NULL,
    [ValidToDateKey]           INT            NOT NULL,
    [IsCurrent]                BIT            NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]      BIGINT         NULL,
    [InterviewType]            INT            NOT NULL,
    [InterviewTypeName]        NVARCHAR (250) NOT NULL,
    [InterviewTypeDisplayName] NVARCHAR (250) NOT NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL,
    CONSTRAINT [PK_QA_InterviewType] PRIMARY KEY CLUSTERED ([InterviewTypeKey] ASC),
    CONSTRAINT [BK_QA_InterviewType] UNIQUE NONCLUSTERED ([InterviewType] ASC)
);


GO

