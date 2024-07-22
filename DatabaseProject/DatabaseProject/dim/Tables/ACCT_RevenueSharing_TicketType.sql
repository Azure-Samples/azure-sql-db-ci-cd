CREATE TABLE [dim].[ACCT_RevenueSharing_TicketType] (
    [TicketTypeKey]          INT            NOT NULL,
    [ValidFromDateKey]       INT            NOT NULL,
    [ValidToDateKey]         INT            NOT NULL,
    [IsCurrent]              INT            NOT NULL,
    [SourceSystemCode]       NVARCHAR (20)  NULL,
    [SourceSystemEntryId]    NVARCHAR (20)  NULL,
    [TicketTypeCode]         NVARCHAR (20)  NULL,
    [TicketTypeName]         NVARCHAR (100) NULL,
    [TicketTypeDisplayIndex] INT            NOT NULL
);


GO

