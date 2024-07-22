CREATE TABLE [stg_dim].[RT_SignalPriority_ITS_LightProgram] (
    [LightProgramKey]      VARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef] INT            NOT NULL,
    [SourceSystemCode]     VARCHAR (20)   NOT NULL,
    [LightId]              INT            NOT NULL,
    [Program]              VARCHAR (14)   NOT NULL,
    [ProgramTimeInSeconds] INT            NOT NULL,
    [Hash]                 VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_RT_SignalPriority_ITS_LightProgram_LightProgramKey] PRIMARY KEY CLUSTERED ([LightProgramKey] ASC)
);


GO

