CREATE TABLE [fact].[CS_NextBus_Logs] (
    [SourceSystemCode]  NVARCHAR (7)  NOT NULL,
    [StopPointKey]      INT           NOT NULL,
    [DateKey]           INT           NOT NULL,
    [IsSuccededRequest] INT           NOT NULL,
    [NoOfObservations]  INT           NOT NULL,
    [Inserted]          DATETIME2 (7) NULL,
    [Updated]           DATETIME2 (7) NULL,
    CONSTRAINT [PK_CS_NextBus_Logs] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [StopPointKey] ASC, [DateKey] ASC, [NoOfObservations] ASC, [IsSuccededRequest] ASC)
);


GO

