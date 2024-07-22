CREATE TABLE [integration].[ImportControl] (
    [SourceSystemCode] NVARCHAR (20)  NOT NULL,
    [EntityName]       NVARCHAR (100) NOT NULL,
    [Description]      NVARCHAR (200) NOT NULL,
    [FromDateTime]     DATETIME2 (7)  NULL,
    [ToDateTime]       DATETIME2 (7)  NULL,
    [State]            TINYINT        NOT NULL,
    [CdcDateTimeMark]  DATETIME2 (7)  NULL,
    [CdcVersionMark]   BIGINT         NULL,
    [CdcLsnMark]       NUMERIC (25)   NULL,
    CONSTRAINT [PK_SourceControl] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [EntityName] ASC)
);


GO

