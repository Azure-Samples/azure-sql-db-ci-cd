CREATE TABLE [data].[DW_ServiceCatalog_Solution] (
    [PartitionKey]              NVARCHAR (200)     NOT NULL,
    [RowKey]                    NVARCHAR (200)     NOT NULL,
    [Timestamp]                 DATETIMEOFFSET (7) NOT NULL,
    [BusinessName]              NVARCHAR (200)     NULL,
    [Description]               NVARCHAR (MAX)     NULL,
    [Name]                      NVARCHAR (200)     NULL,
    [OtherComponentDescription] NVARCHAR (MAX)     NULL,
    [PrimarySolutionOwner]      NVARCHAR (200)     NULL,
    [SecondarySolutionOwner]    NVARCHAR (200)     NULL,
    [SqlLocation]               INT                NULL,
    [SqlTables]                 NVARCHAR (MAX)     NULL,
    [UsesAnalysisServices]      BIT                NULL,
    [UsesAzureFunction]         BIT                NULL,
    [UsesDataFactory]           BIT                NULL,
    [UsesDataLake]              BIT                NULL,
    [UsesIntegrationServices]   BIT                NULL,
    [UsesOtherComponents]       BIT                NULL,
    [UsesPaginatedReports]      BIT                NULL,
    [UsesPowerBIReports]        BIT                NULL,
    [UsesSqlDataWarehouse]      BIT                NULL,
    [DataLakeRootPath]          NVARCHAR (MAX)     NULL,
    [Inserted]                  DATETIME2 (0)      NOT NULL,
    [Updated]                   DATETIME2 (0)      NOT NULL,
    [Hash]                      VARBINARY (32)     NOT NULL,
    CONSTRAINT [PK_DW_ServiceCatalog_Solution] PRIMARY KEY CLUSTERED ([PartitionKey] ASC, [RowKey] ASC)
);


GO

