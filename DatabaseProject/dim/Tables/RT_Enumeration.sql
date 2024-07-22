CREATE TABLE [dim].[RT_Enumeration] (
    [EnumerationKey]               INT            IDENTITY (1, 1) NOT NULL,
    [ValidFromDateKey]             INT            NOT NULL,
    [ValidToDateKey]               INT            NOT NULL,
    [IsCurrent]                    BIT            NOT NULL,
    [SourceSystemCode]             NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]          BIGINT         NULL,
    [EnumerationType]              NVARCHAR (250) NOT NULL,
    [EnumerationTypeName]          NVARCHAR (250) NOT NULL,
    [EnumerationTypeDisplayName]   NVARCHAR (250) NOT NULL,
    [EnumerationTypeDisplayIndex]  INT            NOT NULL,
    [EnumerationStateName]         NVARCHAR (250) NOT NULL,
    [EnumerationStateDisplayName]  NVARCHAR (250) NOT NULL,
    [EnumerationStateDisplayIndex] INT            NULL,
    [EnumerationStateDescription]  NVARCHAR (250) NULL,
    [RDACode]                      NVARCHAR (250) NULL,
    [EnumerationStateNumber]       NVARCHAR (250) NULL,
    [ValidFromDate]                DATE           NULL,
    [ValidToDate]                  DATE           NULL,
    CONSTRAINT [PK_RT_Enumeration] PRIMARY KEY CLUSTERED ([EnumerationKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [RT_Enumeration_Merge]
    ON [dim].[RT_Enumeration]([SourceSystemCode] ASC, [EnumerationType] ASC, [EnumerationStateName] ASC)
    INCLUDE([ValidFromDateKey], [ValidToDateKey], [IsCurrent], [EnumerationTypeName], [EnumerationTypeDisplayName], [EnumerationTypeDisplayIndex], [EnumerationStateDisplayName], [EnumerationStateDisplayIndex], [EnumerationStateDescription], [RDACode], [EnumerationStateNumber], [ValidFromDate], [ValidToDate]);


GO

