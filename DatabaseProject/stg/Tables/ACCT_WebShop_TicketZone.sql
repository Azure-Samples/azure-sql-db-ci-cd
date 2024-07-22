CREATE TABLE [stg].[ACCT_WebShop_TicketZone] (
    [TicketRef]    NVARCHAR (20) NULL,
    [ZoneRef]      NVARCHAR (20) NULL,
    [ZoneNumber]   INT           NULL,
    [RateAreaCode] NVARCHAR (20) NULL,
    [Date]         DATE          NULL
);


GO

CREATE CLUSTERED INDEX [IX_ACCT_WebShop_TicketZone]
    ON [stg].[ACCT_WebShop_TicketZone]([TicketRef] ASC, [ZoneRef] ASC);


GO

