CREATE TABLE [dim].[ACCT_RevenueSharing_PassengerType] (
    [PassengerTypeKey]          INT            NOT NULL,
    [ValidFromDateKey]          INT            NOT NULL,
    [ValidToDateKey]            INT            NOT NULL,
    [IsCurrent]                 INT            NOT NULL,
    [SourceSystemCode]          NVARCHAR (20)  NULL,
    [SourceSystemEntryId]       NVARCHAR (20)  NULL,
    [PassengerTypeCode]         NVARCHAR (20)  NULL,
    [PassengerTypeName]         NVARCHAR (100) NULL,
    [PassengerTypeDisplayIndex] INT            NOT NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_PassengerType] PRIMARY KEY CLUSTERED ([PassengerTypeKey] ASC)
);


GO

