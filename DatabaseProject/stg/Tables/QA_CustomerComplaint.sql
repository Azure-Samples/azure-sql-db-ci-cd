CREATE TABLE [stg].[QA_CustomerComplaint] (
    [Id]               NVARCHAR (20)  NOT NULL,
    [DateKey]          INT            NOT NULL,
    [TimeKey]          INT            NULL,
    [LineKey]          INT            NULL,
    [Subject]          NVARCHAR (200) NULL,
    [IncidentDate]     DATE           NOT NULL,
    [IncidentTime]     NVARCHAR (20)  NULL,
    [LineDesignation]  NVARCHAR (50)  NULL,
    [StopPointName]    NVARCHAR (100) NULL,
    [Direction]        NVARCHAR (200) NULL,
    [DepartureTime]    NVARCHAR (20)  NULL,
    [Description]      VARCHAR (MAX)  NULL,
    [SourceSystemCode] NVARCHAR (10)  NULL
);


GO

