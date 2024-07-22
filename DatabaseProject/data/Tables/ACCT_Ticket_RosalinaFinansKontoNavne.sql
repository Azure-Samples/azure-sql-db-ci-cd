CREATE TABLE [data].[ACCT_Ticket_RosalinaFinansKontoNavne] (
    [FinansKontoNr]   INT            NOT NULL,
    [FinansKontoNavn] VARCHAR (100)  NULL,
    [Inserted]        DATETIME2 (0)  NULL,
    [Updated]         DATETIME2 (0)  NULL,
    [Hash]            VARBINARY (32) NULL,
    CONSTRAINT [PK_ACCT_Ticket_RosalinaFinansKontoNavne] PRIMARY KEY CLUSTERED ([FinansKontoNr] ASC)
);


GO

