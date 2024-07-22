CREATE TABLE [stg].[DW_ServiceCatalog_Role] (
    [PartitionKey] NVARCHAR (MAX)     NULL,
    [RowKey]       NVARCHAR (MAX)     NULL,
    [Timestamp]    DATETIMEOFFSET (7) NULL,
    [Name]         NVARCHAR (MAX)     NULL,
    [BusinessName] NVARCHAR (MAX)     NULL,
    [Description]  NVARCHAR (MAX)     NULL,
    [AdGroup]      NVARCHAR (MAX)     NULL
);


GO

