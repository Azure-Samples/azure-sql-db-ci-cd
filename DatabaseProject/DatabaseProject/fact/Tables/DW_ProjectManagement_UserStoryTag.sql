CREATE TABLE [fact].[DW_ProjectManagement_UserStoryTag] (
    [UserStoryTagKey]          INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]     NVARCHAR (250) NULL,
    [SourceSystemUserStoryRef] NVARCHAR (20)  NULL,
    [UserStoryKey]             INT            NOT NULL,
    [SourceSystemTagRef]       NVARCHAR (250) NULL,
    [TagKey]                   INT            NOT NULL,
    CONSTRAINT [PK_DW_ProjectManagement_UserStoryTag] PRIMARY KEY CLUSTERED ([UserStoryTagKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [DW_ProjectManagement_UserStoryTag_SourceSystemEntryRef]
    ON [fact].[DW_ProjectManagement_UserStoryTag]([SourceSystemEntryRef] ASC);


GO

