CREATE TABLE [stg].[DW_ServiceCatalog_DataArea] (
    [PartitionKey] NVARCHAR (MAX)     NULL,
    [RowKey]       NVARCHAR (MAX)     NULL,
    [Timestamp]    DATETIMEOFFSET (7) NULL,
    [BusinessName] NVARCHAR (MAX)     NULL,
    [Name]         NVARCHAR (MAX)     NULL,
    [Description]  NVARCHAR (MAX)     NULL
);


GO

