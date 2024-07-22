CREATE TABLE [data].[RT_PubTrans_LineDirection] (
    [SourceSystemCode]         NVARCHAR (20)  NOT NULL,
    [SourceSystemEntityRef]    NVARCHAR (20)  NOT NULL,
    [LinePid]                  BIGINT         NOT NULL,
    [LineDirectionSid]         BIGINT         NOT NULL,
    [LineDirectionPid]         BIGINT         NOT NULL,
    [LineDirectionGid]         BIGINT         NOT NULL,
    [LineDirectionNumber]      BIGINT         NOT NULL,
    [LineDirectionCode]        INT            NULL,
    [LineDirectionName]        NVARCHAR (50)  NULL,
    [LineDirectionDescription] NVARCHAR (255) NULL,
    [ValidFromDate]            DATE           NOT NULL,
    [ValidToDate]              DATE           NULL,
    CONSTRAINT [PK_RT_PubTrans_LineDirection] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntityRef] ASC)
);


GO

