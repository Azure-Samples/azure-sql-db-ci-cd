CREATE TABLE [stg].[RT_PubTrans_LineDirection] (
    [SourceSystemCode]         NVARCHAR (20)  NULL,
    [SourceSystemEntityRef]    NVARCHAR (20)  NULL,
    [LinePid]                  BIGINT         NULL,
    [LineDirectionSid]         BIGINT         NULL,
    [LineDirectionPid]         BIGINT         NULL,
    [LineDirectionGid]         BIGINT         NULL,
    [LineDirectionNumber]      BIGINT         NULL,
    [LineDirectionCode]        INT            NULL,
    [LineDirectionName]        NVARCHAR (50)  NULL,
    [LineDirectionDescription] NVARCHAR (255) NULL,
    [ValidFromDate]            DATE           NULL,
    [ValidToDate]              DATE           NULL
);


GO

