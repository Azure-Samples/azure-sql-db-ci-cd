CREATE TABLE [dim].[DW_ProjectManagement_Tag] (
    [TagKey]               INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]     INT            NOT NULL,
    [ValidToDateKey]       INT            NOT NULL,
    [IsCurrent]            BIT            NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (255) NOT NULL,
    [Tag]                  NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_DW_ProjectManagementTag] PRIMARY KEY CLUSTERED ([TagKey] ASC)
);


GO

