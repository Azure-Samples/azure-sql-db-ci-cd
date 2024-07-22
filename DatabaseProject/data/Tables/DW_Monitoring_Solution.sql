CREATE TABLE [data].[DW_Monitoring_Solution] (
    [Id]                   INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]     NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef] NVARCHAR (250) NULL,
    [DataAreaCode]         NVARCHAR (250) NULL,
    [Solution]             NVARCHAR (250) NULL,
    [DateTime]             DATETIME       NOT NULL,
    [BusinessRule]         NVARCHAR (250) NULL,
    [Result]               TINYINT        NULL,
    [ResultDescription]    NVARCHAR (250) NULL,
    [MetaData]             XML            NULL,
    CONSTRAINT [PK_DW_Monitoring_Solution] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

