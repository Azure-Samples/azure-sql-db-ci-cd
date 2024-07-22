CREATE TABLE [data].[ACCT_Ticket_RosalinaStamkort] (
    [Stamkort_Nr]         INT            NOT NULL,
    [Stamkort_Blanket]    VARCHAR (11)   NOT NULL,
    [Zoner]               VARCHAR (50)   NULL,
    [PeriodekortType_Tag] VARCHAR (20)   NULL,
    [Inserted]            DATETIME2 (0)  NULL,
    [Updated]             DATETIME2 (0)  NULL,
    [Hash]                VARBINARY (32) NULL,
    CONSTRAINT [PK_ACCT_Ticket_RosalinaStamkort_1] PRIMARY KEY CLUSTERED ([Stamkort_Nr] ASC, [Stamkort_Blanket] ASC)
);


GO

