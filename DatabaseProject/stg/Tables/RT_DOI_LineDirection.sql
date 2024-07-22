CREATE TABLE [stg].[RT_DOI_LineDirection] (
    [LineDirectionId]         DECIMAL (16)  NULL,
    [LineDirectionGid]        DECIMAL (16)  NULL,
    [LineDirectionCode]       CHAR (1)      NULL,
    [LineDirectionName]       NVARCHAR (50) NULL,
    [LineId]                  DECIMAL (16)  NULL,
    [ValidFromDate]           DATE          NULL,
    [ValidToDate]             DATE          NULL,
    [LastModifiedUtcDateTime] DATETIME2 (3) NULL
);


GO

