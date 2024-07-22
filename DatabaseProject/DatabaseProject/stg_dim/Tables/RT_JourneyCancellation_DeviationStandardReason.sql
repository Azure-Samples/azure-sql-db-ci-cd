CREATE TABLE [stg_dim].[RT_JourneyCancellation_DeviationStandardReason] (
    [ValidFromDateKey]            INT            NULL,
    [ValidToDateKey]              INT            NULL,
    [IsCurrent]                   BIT            NULL,
    [SourceSystemCode]            NVARCHAR (20)  NULL,
    [DeviationStandardReasonCode] NVARCHAR (255) NULL,
    [DeviationStandardReasonName] NVARCHAR (255) NULL,
    [SourceSystemEntryRef]        NVARCHAR (50)  NULL
);


GO

