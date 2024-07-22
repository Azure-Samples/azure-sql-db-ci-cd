CREATE TABLE [stg].[APC_PlannedJourneyFileStatus] (
    [Id]           INT            IDENTITY (1, 1) NOT NULL,
    [DateTime]     DATETIME       NOT NULL,
    [FileName]     NVARCHAR (255) NOT NULL,
    [FileDataDate] DATE           NOT NULL,
    [Status]       INT            NOT NULL,
    CONSTRAINT [PK_APC_PlannedJourneyFileStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

