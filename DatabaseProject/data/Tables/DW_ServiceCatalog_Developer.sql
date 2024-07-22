CREATE TABLE [data].[DW_ServiceCatalog_Developer] (
    [PartitionKey]  NVARCHAR (200)     NOT NULL,
    [RowKey]        NVARCHAR (200)     NOT NULL,
    [Timestamp]     DATETIMEOFFSET (7) NOT NULL,
    [EmpoyeeCode]   NVARCHAR (200)     NULL,
    [GitHubAccount] NVARCHAR (200)     NULL,
    [IsActive]      BIT                NULL,
    [Name]          NVARCHAR (200)     NULL,
    [TaigaAccount]  NVARCHAR (200)     NULL,
    [Inserted]      DATETIME2 (0)      NOT NULL,
    [Updated]       DATETIME2 (0)      NOT NULL,
    [Hash]          VARBINARY (32)     NOT NULL,
    CONSTRAINT [PK_DW_ServiceCatalog_Developer] PRIMARY KEY CLUSTERED ([PartitionKey] ASC, [RowKey] ASC)
);


GO

