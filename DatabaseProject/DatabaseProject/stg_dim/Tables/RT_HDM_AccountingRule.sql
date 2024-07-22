CREATE TABLE [stg_dim].[RT_HDM_AccountingRule] (
    [SourceSystemCode]                    NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryRef]                NVARCHAR (250) NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50)  NULL,
    [DeviationReasonCustomCategoryName]   NVARCHAR (250) NULL,
    [Meaning]                             NVARCHAR (250) NULL,
    [WithholdPaymentYesNo]                INT            NULL,
    [RespitePeriodSeconds]                BIGINT         NULL,
    [Type]                                NVARCHAR (50)  NULL
);


GO

