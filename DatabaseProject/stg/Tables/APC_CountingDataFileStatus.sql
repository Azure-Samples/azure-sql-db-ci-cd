CREATE TABLE [stg].[APC_CountingDataFileStatus] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [DateTime]         DATETIME       NOT NULL,
    [FileName]         NVARCHAR (255) NOT NULL,
    [FileDataDate]     DATE           NOT NULL,
    [SizeCompressed]   BIGINT         NOT NULL,
    [SizeUncompressed] BIGINT         NOT NULL,
    [Hash]             VARCHAR (40)   NOT NULL,
    [Status]           INT            NOT NULL,
    CONSTRAINT [PK_APC_JourneyDataFileStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

