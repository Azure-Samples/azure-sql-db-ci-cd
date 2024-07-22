CREATE TABLE [stg].[DW_ServiceCatalog_Solution] (
    [PartitionKey]              NVARCHAR (MAX)     NULL,
    [RowKey]                    NVARCHAR (MAX)     NULL,
    [Timestamp]                 DATETIMEOFFSET (7) NULL,
    [BusinessName]              NVARCHAR (MAX)     NULL,
    [Description]               NVARCHAR (MAX)     NULL,
    [Name]                      NVARCHAR (MAX)     NULL,
    [OtherComponentDescription] NVARCHAR (MAX)     NULL,
    [PrimarySolutionOwner]      NVARCHAR (MAX)     NULL,
    [SecondarySolutionOwner]    NVARCHAR (MAX)     NULL,
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
    [DataLakeRootPath]          NVARCHAR (MAX)     NULL
);


GO

