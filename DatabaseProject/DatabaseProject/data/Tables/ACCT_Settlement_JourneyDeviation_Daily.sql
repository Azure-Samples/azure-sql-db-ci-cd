CREATE TABLE [data].[ACCT_Settlement_JourneyDeviation_Daily] (
    [SourceSystemCode]                    NVARCHAR (20) NOT NULL,
    [SourceSystemEntryRef]                NVARCHAR (50) NOT NULL,
    [Id]                                  BIGINT        NOT NULL,
    [JourneyRef]                          CHAR (18)     NOT NULL,
    [DeviationReasonStandardCategoryCode] NVARCHAR (50) NOT NULL,
    [ReportedDateTime]                    DATETIME      NOT NULL,
    [FromSequenceNumber]                  INT           NOT NULL,
    [FromJourneyPointRef]                 CHAR (22)     NOT NULL,
    [UptoSequenceNumber]                  INT           NOT NULL,
    [UptoJourneyPointRef]                 CHAR (22)     NOT NULL,
    [WithholdPayment]                     BIT           NULL,
    [Hash]                                BINARY (32)   NULL,
    [Inserted]                            DATETIME2 (7) NULL,
    [Updated]                             DATETIME2 (7) NULL,
    CONSTRAINT [PK_ACCT_Settlement_JourneyDeviation_Daily] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

