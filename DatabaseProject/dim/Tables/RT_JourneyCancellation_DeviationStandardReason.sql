CREATE TABLE [dim].[RT_JourneyCancellation_DeviationStandardReason] (
    [DeviationStandardReasonKey]  INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]            INT            NULL,
    [ValidToDateKey]              INT            NULL,
    [IsCurrent]                   BIT            NULL,
    [SourceSystemCode]            NVARCHAR (20)  NULL,
    [DeviationStandardReasonCode] NVARCHAR (255) NOT NULL,
    [DeviationStandardReasonName] NVARCHAR (255) NULL,
    [SourceSystemEntryRef]        NVARCHAR (50)  NULL,
    CONSTRAINT [PK_RT_DeviationStandardReason] PRIMARY KEY CLUSTERED ([DeviationStandardReasonKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_DeviationStandardReason_DeviationStandardReasonCode]
    ON [dim].[RT_JourneyCancellation_DeviationStandardReason]([DeviationStandardReasonCode] ASC);


GO

