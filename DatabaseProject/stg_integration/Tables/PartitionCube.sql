CREATE TABLE [stg_integration].[PartitionCube] (
    [SolutionName]    NVARCHAR (255) NULL,
    [PartitionId]     NVARCHAR (255) NULL,
    [CubeId]          NVARCHAR (255) NULL,
    [DatabaseId]      NVARCHAR (255) NULL,
    [FactTableCube]   NVARCHAR (255) NULL,
    [FactTableEdw]    NVARCHAR (255) NULL,
    [MeasureGroupId]  NVARCHAR (255) NULL,
    [QueryCriteria]   NVARCHAR (255) NULL,
    [Type]            NVARCHAR (255) NULL,
    [DynamicNamePart] NVARCHAR (255) NULL,
    [QueryDefinition] NVARCHAR (255) NULL,
    [DateMin]         DATE           NULL,
    [DateMax]         DATE           NULL,
    [NumOfRows]       BIGINT         NULL
);


GO

