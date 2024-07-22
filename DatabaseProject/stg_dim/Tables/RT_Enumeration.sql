CREATE TABLE [stg_dim].[RT_Enumeration] (
    [EnumerationKey]               INT            NULL,
    [ValidFromDateKey]             INT            NULL,
    [ValidToDateKey]               INT            NULL,
    [IsCurrent]                    BIT            NULL,
    [SourceSystemCode]             NVARCHAR (20)  NOT NULL,
    [SourceSystemEntryId]          BIGINT         NULL,
    [EnumerationType]              NVARCHAR (250) NULL,
    [EnumerationTypeName]          NVARCHAR (250) NULL,
    [EnumerationTypeDisplayName]   NVARCHAR (250) NULL,
    [EnumerationTypeDisplayIndex]  INT            NULL,
    [EnumerationStateName]         NVARCHAR (250) NULL,
    [EnumerationStateDisplayName]  NVARCHAR (250) NULL,
    [EnumerationStateDisplayIndex] INT            NULL,
    [EnumerationStateDescription]  NVARCHAR (250) NULL,
    [RDACode]                      NVARCHAR (250) NULL,
    [EnumerationStateNumber]       NVARCHAR (250) NULL,
    [ValidFromDate]                DATE           NULL,
    [ValidToDate]                  DATE           NULL
);


GO

