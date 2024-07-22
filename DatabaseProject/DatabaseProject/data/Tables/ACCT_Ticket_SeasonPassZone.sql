CREATE TABLE [data].[ACCT_Ticket_SeasonPassZone] (
    [SeasonPassRef] NVARCHAR (20) NOT NULL,
    [ZoneRef]       NVARCHAR (20) NOT NULL,
    [ZoneNumber]    INT           NULL,
    [RateAreaCode]  NVARCHAR (20) NULL,
    [IsInvalid]     BIT           NULL,
    [Inserted]      DATETIME2 (0) NOT NULL,
    [Updated]       DATETIME2 (0) NULL,
    CONSTRAINT [PK_ACCT_Ticket_SeasonPassZone] PRIMARY KEY CLUSTERED ([SeasonPassRef] ASC, [ZoneRef] ASC)
);


GO

