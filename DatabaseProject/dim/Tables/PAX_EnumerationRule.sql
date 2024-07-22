CREATE TABLE [dim].[PAX_EnumerationRule] (
    [EnumerationRuleKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]           INT            NOT NULL,
    [ValidToDateKey]             INT            NOT NULL,
    [IsCurrent]                  BIT            NOT NULL,
    [SourceSystemCode]           NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]        BIGINT         NULL,
    [EnumerationType]            INT            NOT NULL,
    [EnumerationTypeCode]        NVARCHAR (20)  NOT NULL,
    [EnumerationRuleNumber]      INT            NOT NULL,
    [EnumerationRuleName]        NVARCHAR (250) NOT NULL,
    [EnumerationRuleDisplayName] NVARCHAR (250) NOT NULL,
    [EnumerationRuleDescription] NVARCHAR (250) NOT NULL,
    [ValidFromDate]              DATE           NOT NULL,
    [ValidToDate]                DATE           NULL,
    CONSTRAINT [PK_EnumerationRule] PRIMARY KEY CLUSTERED ([EnumerationRuleKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_PAX_EnumerationRule_SourceSystemCode_EnumerationType_EnumerationRuleNumber]
    ON [dim].[PAX_EnumerationRule]([SourceSystemCode] ASC, [EnumerationType] ASC, [EnumerationRuleNumber] ASC);


GO

