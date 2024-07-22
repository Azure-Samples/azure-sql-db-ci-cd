CREATE TABLE [security].[GDPR_DeleteAnonymize_Log] (
    [Id]                        INT            IDENTITY (1, 1) NOT NULL,
    [PipelineName]              NVARCHAR (250) NOT NULL,
    [PipelineExecutionDateTime] DATETIME2 (3)  NOT NULL,
    [Database]                  NVARCHAR (250) NULL,
    [Schema]                    NVARCHAR (250) NULL,
    [Table]                     NVARCHAR (250) NULL,
    [Column]                    NVARCHAR (250) NULL,
    [Operation]                 NVARCHAR (250) NULL,
    [NoObs]                     INT            NULL,
    [Description]               NVARCHAR (250) NULL
);


GO

