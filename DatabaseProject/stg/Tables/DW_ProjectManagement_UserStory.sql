CREATE TABLE [stg].[DW_ProjectManagement_UserStory] (
    [UserStoryKey]              INT                NULL,
    [SourceSystemCode]          NVARCHAR (20)      NOT NULL,
    [SourceSystemEntryRef]      NVARCHAR (20)      NOT NULL,
    [Subject]                   NVARCHAR (1000)    NULL,
    [Description]               NVARCHAR (MAX)     NULL,
    [SourceSystemMilestoneRef]  NVARCHAR (20)      NULL,
    [MilestoneCode]             NVARCHAR (20)      NULL,
    [SourceSystemOwnerRef]      NVARCHAR (20)      NULL,
    [OwnerEmployeeCode]         NVARCHAR (20)      NULL,
    [SourceSystemAssignedToRef] NVARCHAR (100)     NULL,
    [AssignedToEmployeeCode]    NVARCHAR (20)      NULL,
    [StatusCode]                NVARCHAR (20)      NULL,
    [StatusText]                NVARCHAR (20)      NULL,
    [IsClosed]                  BIT                NULL,
    [CreatedDate]               DATETIMEOFFSET (0) NULL,
    [ModifiedDate]              DATETIMEOFFSET (0) NULL,
    [FinishDate]                DATETIMEOFFSET (0) NULL,
    [IsClientRequirement]       BIT                NULL,
    [IsTeamRequirement]         BIT                NULL,
    [DeadlineDate]              DATE               NULL,
    [OrganizationCode]          NVARCHAR (100)     NULL,
    [EmployeeCode]              NVARCHAR (100)     NULL,
    [Priority]                  TINYINT            NULL,
    [Tags]                      NVARCHAR (MAX)     NULL
);


GO

