CREATE TABLE [dim].[RT_HDM_AccountingRule] (
    [AccountingRuleKey]                   INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]                    NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]                NVARCHAR (250) NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50)  NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (250) NULL,
    [Meaning]                             NVARCHAR (250) NULL,
    [WithholdPaymentYesNo]                INT            NULL,
    [RespitePeriodSeconds]                BIGINT         NULL,
    [Type]                                NVARCHAR (50)  NULL,
    [Hash]                                BINARY (32)    NULL,
    [Inserted]                            DATETIME2 (0)  NOT NULL,
    [Updated]                             DATETIME2 (0)  NOT NULL,
    CONSTRAINT [PK_RT_HDM_AccountingRule_1] PRIMARY KEY CLUSTERED ([AccountingRuleKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_RT_HDM_AccountingRule_Merge]
    ON [dim].[RT_HDM_AccountingRule]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([WithholdPaymentYesNo], [Meaning], [RespitePeriodSeconds]);


GO

