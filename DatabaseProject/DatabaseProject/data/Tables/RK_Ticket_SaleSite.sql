CREATE TABLE [data].[RK_Ticket_SaleSite] (
    [SaleSiteCode]       NVARCHAR (20)  NOT NULL,
    [SaleSiteName]       NVARCHAR (250) NOT NULL,
    [SaleSitePostalCode] NVARCHAR (20)  NULL,
    [SaleSiteCity]       NVARCHAR (250) NULL,
    [SourceSystemCode]   NVARCHAR (20)  NOT NULL,
    [Inserted]           DATETIME2 (0)  NULL,
    [Updated]            DATETIME2 (0)  NULL,
    [Hash]               VARBINARY (32) NULL,
    [SaleSiteEmail]      NVARCHAR (250) NULL,
    CONSTRAINT [PK_RK_Ticket_SaleSite] PRIMARY KEY CLUSTERED ([SaleSiteCode] ASC)
);


GO

