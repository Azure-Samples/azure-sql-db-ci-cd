CREATE TABLE [stg].[DW_Monitoring_Solution] (
    [Id]                   INT            NULL,
    [SourceSystemCode]     NVARCHAR (20)  NULL,
    [SourceSystemEntryRef] NVARCHAR (250) NULL,
    [DataAreaCode]         NVARCHAR (250) NULL,
    [Solution]             NVARCHAR (250) NULL,
    [DateTime]             DATETIME       NULL,
    [BusinessRule]         NVARCHAR (250) NULL,
    [Result]               TINYINT        NULL,
    [ResultDescription]    NVARCHAR (250) NULL,
    [MetaData]             XML            NULL
);


GO

