CREATE TABLE [integration].[RK_Ticket_SalesReportStatus] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [ReportDate]       DATE            NOT NULL,
    [CustomerCode]     NVARCHAR (20)   NOT NULL,
    [CustomerName]     NVARCHAR (250)  NOT NULL,
    [CustomerEmail]    NVARCHAR (250)  NULL,
    [Status]           INT             NOT NULL,
    [ErrorMessage]     NVARCHAR (2000) NULL,
    [ReportRenderTime] INT             NULL,
    [MailSendTime]     INT             NULL,
    CONSTRAINT [PK_RK_Ticket_SalesReportStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

