CREATE TABLE [stg].[DW_ProjectManagement_Task] (
    [TaskKey]                   INT             NULL,
    [SourceSystemCode]          NVARCHAR (50)   NOT NULL,
    [SourceSystemEntryRef]      NVARCHAR (50)   NOT NULL,
    [SourceSystemUserStoryRef]  NVARCHAR (50)   NULL,
    [UserStoryKey]              INT             NULL,
    [Subject]                   NVARCHAR (1000) NULL,
    [Description]               NVARCHAR (MAX)  NULL,
    [SourceSystemMilestoneRef]  NVARCHAR (50)   NULL,
    [MilestoneCode]             NVARCHAR (50)   NULL,
    [SourceSystemOwnerRef]      NVARCHAR (50)   NULL,
    [OwnerEmployeeCode]         NVARCHAR (50)   NULL,
    [SourceSystemAssignedToRef] NVARCHAR (50)   NULL,
    [AssignedToEmployeeCode]    NVARCHAR (50)   NULL,
    [StatusCode]                NVARCHAR (50)   NULL,
    [StatusText]                NVARCHAR (100)  NULL,
    [IsClosed]                  BIT             NULL
);


GO

