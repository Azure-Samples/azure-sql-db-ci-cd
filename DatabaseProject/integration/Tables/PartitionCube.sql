CREATE TABLE [integration].[PartitionCube] (
    [Id]                      INT            IDENTITY (1, 1) NOT NULL,
    [SolutionName]            NVARCHAR (255) NULL,
    [PartitionId]             NVARCHAR (255) NULL,
    [CubeId]                  NVARCHAR (255) NULL,
    [DatabaseId]              NVARCHAR (255) NULL,
    [MeasureGroupId]          NVARCHAR (255) NULL,
    [FactTableCube]           NVARCHAR (255) NULL,
    [FactTableEdw]            NVARCHAR (255) NULL,
    [Type]                    NVARCHAR (255) NULL,
    [DynamicNamePart]         NVARCHAR (255) NULL,
    [Name]                    NVARCHAR (255) NULL,
    [QueryCriteria]           NVARCHAR (255) NULL,
    [QueryDefinition]         NVARCHAR (255) NULL,
    [State]                   NVARCHAR (255) NULL,
    [Action]                  NVARCHAR (255) NULL,
    [Script]                  NVARCHAR (MAX) NULL,
    [CreateDateTime]          DATETIME2 (0)  NULL,
    [DateMin]                 DATE           NULL,
    [DateMax]                 DATE           NULL,
    [NumOfRows]               BIGINT         NULL,
    [ProcessBegin]            DATETIME2 (0)  NULL,
    [ProcessEnd]              DATETIME2 (0)  NULL,
    [RemainingReprocessTries] INT            NULL,
    [ForceDelete]             BIT            NULL
);


GO

