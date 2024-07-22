CREATE TABLE [stg].[DW_ProjectManagement_UserStoryTag] (
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]     NVARCHAR (250) NULL,
    [SourceSystemUserStoryRef] NVARCHAR (20)  NULL,
    [SourceSystemTagRef]       NVARCHAR (250) NULL,
    [UserStoryKey]             INT            NULL,
    [TagKey]                   INT            NULL
);


GO

