CREATE TABLE [data].[DW_ServiceCatalog_Role] (
    [PartitionKey] NVARCHAR (200)     NOT NULL,
    [RowKey]       NVARCHAR (200)     NOT NULL,
    [Timestamp]    DATETIMEOFFSET (7) NOT NULL,
    [Name]         NVARCHAR (200)     NULL,
    [BusinessName] NVARCHAR (200)     NULL,
    [Description]  NVARCHAR (MAX)     NULL,
    [AdGroup]      NVARCHAR (200)     NULL,
    [Inserted]     DATETIME2 (0)      NOT NULL,
    [Updated]      DATETIME2 (0)      NOT NULL,
    [Hash]         VARBINARY (32)     NOT NULL,
    CONSTRAINT [PK_DW_ServiceCatalog_Role] PRIMARY KEY CLUSTERED ([PartitionKey] ASC, [RowKey] ASC)
);


GO

