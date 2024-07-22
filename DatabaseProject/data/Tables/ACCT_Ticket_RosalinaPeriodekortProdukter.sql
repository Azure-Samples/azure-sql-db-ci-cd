CREATE TABLE [data].[ACCT_Ticket_RosalinaPeriodekortProdukter] (
    [PeriodekortType_Tag] VARCHAR (20)   NOT NULL,
    [Passagertype]        VARCHAR (20)   NULL,
    [Inserted]            DATETIME2 (0)  NULL,
    [Updated]             DATETIME2 (0)  NULL,
    [Hash]                VARBINARY (32) NULL,
    CONSTRAINT [PK_ACCT_Ticket_RosalinaPeriodekortProdukter_1] PRIMARY KEY CLUSTERED ([PeriodekortType_Tag] ASC)
);


GO

