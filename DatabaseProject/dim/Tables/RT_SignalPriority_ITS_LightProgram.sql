CREATE TABLE [dim].[RT_SignalPriority_ITS_LightProgram] (
    [LightProgramKey]      VARCHAR (20)   NOT NULL,
    [ValidFromDateKey]     INT            NOT NULL,
    [ValidToDateKey]       INT            NOT NULL,
    [SourceSystemEntryRef] INT            NOT NULL,
    [SourceSystemCode]     VARCHAR (20)   NOT NULL,
    [LightId]              INT            NOT NULL,
    [Program]              VARCHAR (14)   NOT NULL,
    [ProgramTimeInSeconds] INT            NOT NULL,
    [IsCurrent]            BIT            NOT NULL,
    [ValidFromDate]        DATE           NOT NULL,
    [ValidToDate]          DATE           NULL,
    [Inserted]             DATETIME2 (0)  NOT NULL,
    [Updated]              DATETIME2 (0)  NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_LightProgramKey] PRIMARY KEY CLUSTERED ([LightProgramKey] ASC, [ValidFromDateKey] ASC, [ValidToDateKey] ASC)
);


GO

