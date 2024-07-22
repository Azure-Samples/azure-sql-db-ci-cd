CREATE TABLE [dim].[RT_JourneyCancellation_DeviationCustomReason] (
    [DeviationCustomReasonKey]         INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]                 INT            NULL,
    [ValidToDateKey]                   INT            NULL,
    [IsCurrent]                        BIT            NULL,
    [SourceSystemEntryRef]             NVARCHAR (255) NOT NULL,
    [ExternalSourceSystemCode]         NVARCHAR (255) NULL,
    [DeviationStandardReasonCode]      NVARCHAR (255) NULL,
    [DeviationCustomReasonName]        NVARCHAR (255) NULL,
    [DeviationCustomReasonDisplayName] NVARCHAR (255) NULL,
    [SourceSystemCode]                 NVARCHAR (20)  NULL,
    CONSTRAINT [PK_RT_DeviationCustomReason] PRIMARY KEY CLUSTERED ([DeviationCustomReasonKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_DeviationCustomReason_SourceSystemEntryRef]
    ON [dim].[RT_JourneyCancellation_DeviationCustomReason]([SourceSystemEntryRef] ASC);


GO

