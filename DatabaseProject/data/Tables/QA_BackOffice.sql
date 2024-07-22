CREATE TABLE [data].[QA_BackOffice] (
    [Id]               NVARCHAR (20)  NOT NULL,
    [IncidentDate]     DATE           NOT NULL,
    [Subject]          NVARCHAR (200) NULL,
    [IncidentTime]     NVARCHAR (20)  NULL,
    [LineDesignation]  NVARCHAR (50)  NULL,
    [StopPointName]    NVARCHAR (100) NULL,
    [Direction]        NVARCHAR (200) NULL,
    [DepartureTime]    NVARCHAR (20)  NULL,
    [Description]      VARCHAR (MAX)  NULL,
    [SourceSystemCode] NVARCHAR (10)  NULL,
    CONSTRAINT [PK__QA_BackO__3214EC07021C7EFA] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

