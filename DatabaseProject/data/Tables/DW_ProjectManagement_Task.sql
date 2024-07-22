CREATE TABLE [data].[DW_ProjectManagement_Task] (
    [TaskKey]                INT             IDENTITY (1, 1) NOT NULL,
    [UserStoryKey]           INT             NOT NULL,
    [SourceSystemCode]       NVARCHAR (50)   NOT NULL,
    [SourceSystemEntryRef]   NVARCHAR (50)   NOT NULL,
    [Subject]                NVARCHAR (1000) NULL,
    [Description]            NVARCHAR (MAX)  NULL,
    [MilestoneCode]          NVARCHAR (50)   NULL,
    [OwnerEmployeeCode]      NVARCHAR (50)   NULL,
    [AssignedToEmployeeCode] NVARCHAR (50)   NULL,
    [StatusCode]             NVARCHAR (50)   NULL,
    [StatusText]             NVARCHAR (50)   NULL,
    [IsClosed]               BIT             NULL,
    CONSTRAINT [PK_DW_ProjectManagement_Task] PRIMARY KEY CLUSTERED ([TaskKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [DW_ProjectManagement_Task_SourceSystemEntryRef]
    ON [data].[DW_ProjectManagement_Task]([SourceSystemEntryRef] ASC);


GO

