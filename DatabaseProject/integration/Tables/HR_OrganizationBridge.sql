CREATE TABLE [integration].[HR_OrganizationBridge] (
    [SourceSystemCode]    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId] NVARCHAR (250) NOT NULL,
    [OrganizationCode]    NVARCHAR (20)  NULL,
    [Inserted]            DATETIME2 (0)  NOT NULL,
    [Updated]             DATETIME2 (0)  NOT NULL,
    [Hash]                VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_OrganizationBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryId] ASC)
);


GO

