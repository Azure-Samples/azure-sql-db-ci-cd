CREATE TABLE [stg_fact].[CS_NextBus_Logs] (
    [SourceSystemCode]  NVARCHAR (7) NOT NULL,
    [StopPointKey]      INT          NOT NULL,
    [DateKey]           INT          NOT NULL,
    [IsSuccededRequest] INT          NOT NULL,
    [NoOfObservations]  INT          NOT NULL
);


GO

