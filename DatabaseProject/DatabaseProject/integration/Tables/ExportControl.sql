CREATE TABLE [integration].[ExportControl] (
    [TargetSystemCode] NVARCHAR (20)  NOT NULL,
    [EntityName]       NVARCHAR (100) NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    [FromDateTime]     DATETIME       NULL,
    [ToDateTime]       DATETIME       NULL,
    [State]            TINYINT        NOT NULL,
    [DateTimeMark]     DATETIME       NULL,
    CONSTRAINT [PK_ExportControl] PRIMARY KEY CLUSTERED ([TargetSystemCode] ASC, [EntityName] ASC)
);


GO

