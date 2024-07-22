CREATE TABLE [stg].[DW_ServiceCatalog_DataSet] (
    [PartitionKey]          NVARCHAR (MAX)     NULL,
    [RowKey]                NVARCHAR (MAX)     NULL,
    [Timestamp]             DATETIMEOFFSET (7) NULL,
    [BusinessName]          NVARCHAR (MAX)     NULL,
    [DataArea]              NVARCHAR (MAX)     NULL,
    [Description]           NVARCHAR (MAX)     NULL,
    [Name]                  NVARCHAR (MAX)     NULL,
    [RetentionPolicyText]   NVARCHAR (MAX)     NULL,
    [SqlLocation]           INT                NULL,
    [SqlPrimaryTableName]   NVARCHAR (MAX)     NULL,
    [SqlPrimaryTableSchema] NVARCHAR (MAX)     NULL,
    [UsesDataLake]          BIT                NULL,
    [UsesSqlDataWarehouse]  BIT                NULL,
    [DataLakeFileSystem]    NVARCHAR (MAX)     NULL,
    [DataLakeFormat]        NVARCHAR (MAX)     NULL,
    [DataLakeRootPath]      NVARCHAR (MAX)     NULL,
    [Roles]                 NVARCHAR (MAX)     NULL
);


GO

