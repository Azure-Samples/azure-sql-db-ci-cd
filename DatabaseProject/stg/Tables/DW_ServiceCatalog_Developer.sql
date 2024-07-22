CREATE TABLE [stg].[DW_ServiceCatalog_Developer] (
    [PartitionKey]  NVARCHAR (MAX)     NULL,
    [RowKey]        NVARCHAR (MAX)     NULL,
    [Timestamp]     DATETIMEOFFSET (7) NULL,
    [EmpoyeeCode]   NVARCHAR (MAX)     NULL,
    [GitHubAccount] NVARCHAR (MAX)     NULL,
    [IsActive]      BIT                NULL,
    [Name]          NVARCHAR (MAX)     NULL,
    [TaigaAccount]  NVARCHAR (MAX)     NULL
);


GO

