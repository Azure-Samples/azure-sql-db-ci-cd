CREATE TABLE [data].[ACCT_Ticket_RosalinaKortsalg] (
    [Kortsalg_Nr]   VARCHAR (8)    NOT NULL,
    [Navn]          VARCHAR (80)   NULL,
    [Adresse]       VARCHAR (80)   NULL,
    [Postnummer_by] VARCHAR (80)   NULL,
    [Inserted]      DATETIME2 (0)  NULL,
    [Updated]       DATETIME2 (0)  NULL,
    [Hash]          VARBINARY (32) NULL,
    CONSTRAINT [PK_ACCT_Ticket_RosalinaKortsalg] PRIMARY KEY CLUSTERED ([Kortsalg_Nr] ASC)
);


GO

