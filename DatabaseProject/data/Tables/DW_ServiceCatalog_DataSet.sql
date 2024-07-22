CREATE TABLE [data].[DW_ServiceCatalog_DataSet] (
    [PartitionKey]          NVARCHAR (200)     NOT NULL,
    [RowKey]                NVARCHAR (200)     NOT NULL,
    [Timestamp]             DATETIMEOFFSET (7) NOT NULL,
    [BusinessName]          NVARCHAR (200)     NULL,
    [DataArea]              NVARCHAR (200)     NULL,
    [Description]           NVARCHAR (MAX)     NULL,
    [Name]                  NVARCHAR (200)     NULL,
    [RetentionPolicyText]   NVARCHAR (500)     NULL,
    [SqlLocation]           INT                NULL,
    [SqlPrimaryTableName]   NVARCHAR (MAX)     NULL,
    [SqlPrimaryTableSchema] NVARCHAR (MAX)     NULL,
    [UsesDataLake]          BIT                NULL,
    [UsesSqlDataWarehouse]  BIT                NULL,
    [DataLakeFileSystem]    NVARCHAR (200)     NULL,
    [DataLakeFormat]        NVARCHAR (200)     NULL,
    [DataLakeRootPath]      NVARCHAR (200)     NULL,
    [Roles]                 NVARCHAR (200)     NULL,
    [Inserted]              DATETIME2 (0)      NOT NULL,
    [Updated]               DATETIME2 (0)      NOT NULL,
    [Hash]                  VARBINARY (32)     NOT NULL,
    CONSTRAINT [PK_DW_ServiceCatalog_DataSet] PRIMARY KEY CLUSTERED ([PartitionKey] ASC, [RowKey] ASC)
);


GO

