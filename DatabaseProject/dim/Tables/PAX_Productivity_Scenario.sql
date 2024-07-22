CREATE TABLE [dim].[PAX_Productivity_Scenario] (
    [ScenarioKey]          INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (20)  NOT NULL,
    [ValidFromDateKey]     INT            NOT NULL,
    [ValidToDateKey]       INT            NOT NULL,
    [IsCurrent]            INT            NOT NULL,
    [Year]                 INT            NULL,
    [ScenarioKindCode]     NVARCHAR (20)  NULL,
    [ScenarioKindName]     NVARCHAR (255) NULL,
    [ScenarioCode]         NVARCHAR (20)  NULL,
    [ScenarioName]         NVARCHAR (255) NULL,
    CONSTRAINT [PK_PAX_Productivity_Scenario] PRIMARY KEY CLUSTERED ([ScenarioKey] ASC)
);


GO

