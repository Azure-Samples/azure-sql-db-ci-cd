CREATE TABLE [data].[ACCT_WebShop_TicketZone] (
    [TicketRef]    NVARCHAR (20) NOT NULL,
    [ZoneRef]      NVARCHAR (20) NOT NULL,
    [ZoneNumber]   INT           NULL,
    [RateAreaCode] NVARCHAR (20) NULL,
    [Date]         DATE          NOT NULL,
    [Inserted]     DATETIME2 (0) NOT NULL,
    [Updated]      DATETIME2 (0) NULL,
    CONSTRAINT [PK_ACCT_WebShop_TicketZone] PRIMARY KEY CLUSTERED ([TicketRef] ASC, [ZoneRef] ASC)
);


GO

CREATE NONCLUSTERED INDEX [ACCT_WebShop_TicketZone_TicketRef]
    ON [data].[ACCT_WebShop_TicketZone]([TicketRef] ASC)
    INCLUDE([RateAreaCode]);


GO

