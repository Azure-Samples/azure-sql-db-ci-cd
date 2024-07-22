CREATE TABLE [data].[RT_DOI_LineDirection] (
    [LineDirectionId]         DECIMAL (16)  NOT NULL,
    [LineDirectionGid]        DECIMAL (16)  NULL,
    [LineDirectionCode]       CHAR (1)      NULL,
    [LineDirectionName]       NVARCHAR (50) NULL,
    [LineId]                  DECIMAL (16)  NULL,
    [ValidFromDate]           DATE          NULL,
    [ValidToDate]             DATE          NULL,
    [LastModifiedUtcDateTime] DATETIME2 (3) NULL,
    [InsertedUtc]             DATETIME2 (0) NOT NULL,
    [UpdatedUtc]              DATETIME2 (0) NOT NULL,
    [Hash]                    BINARY (32)   NOT NULL,
    CONSTRAINT [PK_RT_DOI_LineDirection] PRIMARY KEY CLUSTERED ([LineDirectionId] ASC)
);


GO

