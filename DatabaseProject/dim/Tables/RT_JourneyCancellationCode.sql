CREATE TABLE [dim].[RT_JourneyCancellationCode] (
    [JourneyCancellationCodeKey] INT            NOT NULL,
    [ValidFromDateKey]           INT            NULL,
    [ValidToDateKey]             INT            NULL,
    [IsCurrent]                  BIT            NULL,
    [ExternalSourceSystemCode]   NVARCHAR (255) NULL,
    [JourneyCancellationCode]    NVARCHAR (255) NULL,
    [JourneyCancellationType]    NVARCHAR (255) NULL,
    [SourceSystemEntryRef]       NVARCHAR (50)  NULL,
    CONSTRAINT [PK_RT_JourneyCancellationCode] PRIMARY KEY CLUSTERED ([JourneyCancellationCodeKey] ASC)
);


GO

