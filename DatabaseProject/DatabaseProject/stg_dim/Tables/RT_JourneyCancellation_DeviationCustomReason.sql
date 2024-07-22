CREATE TABLE [stg_dim].[RT_JourneyCancellation_DeviationCustomReason] (
    [ValidFromDateKey]                 INT            NULL,
    [ValidToDateKey]                   INT            NULL,
    [IsCurrent]                        BIT            NULL,
    [SourceSystemEntryRef]             NVARCHAR (255) NULL,
    [ExternalSourceSystemCode]         NVARCHAR (255) NULL,
    [DeviationStandardReasonCode]      NVARCHAR (255) NULL,
    [DeviationCustomReasonName]        NVARCHAR (255) NULL,
    [DeviationCustomReasonDisplayName] NVARCHAR (255) NULL,
    [SourceSystemCode]                 NVARCHAR (20)  NULL
);


GO

