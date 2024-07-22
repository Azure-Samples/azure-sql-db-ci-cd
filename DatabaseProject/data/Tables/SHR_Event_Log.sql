CREATE TABLE [data].[SHR_Event_Log] (
    [Id]           NVARCHAR (255) NOT NULL,
    [EventTime]    DATETIME2 (7)  NOT NULL,
    [EventType]    NVARCHAR (255) NOT NULL,
    [Subject]      NVARCHAR (255) NOT NULL,
    [Data]         NVARCHAR (MAX) NULL,
    [ReceivedTime] DATETIME2 (3)  CONSTRAINT [DF_SHR_Event_Log_ReceivedTime] DEFAULT (sysutcdatetime()) NOT NULL
);


GO

