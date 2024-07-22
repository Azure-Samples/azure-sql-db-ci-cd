CREATE TABLE [stg].[ACCT_Settlement_JourneyDeviation_Monthly] (
    [Id]                                  BIGINT        NOT NULL,
    [JourneyRef]                          CHAR (18)     NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50) NULL,
    [ReportedDateTime]                    DATETIME      NULL,
    [FromSequenceNumber]                  INT           NULL,
    [FromJourneyPointRef]                 CHAR (22)     NULL,
    [UptoSequenceNumber]                  INT           NULL,
    [UptoJourneyPointRef]                 CHAR (22)     NULL,
    [WithholdPayment]                     BIT           NULL,
    [SourceSystemCode]                    NVARCHAR (20) NULL,
    [SourceSystemEntryRef]                NVARCHAR (50) NULL
);


GO

