CREATE TABLE [dbo].[TrainingSession] (
    [Id]               INT                DEFAULT (NEXT VALUE FOR [dbo].[Ids]) NOT NULL,
    [RecordedOn]       DATETIMEOFFSET (7) NOT NULL,
    [Type]             VARCHAR (50)       NOT NULL,
    [Steps]            INT                NOT NULL,
    [Distance]         INT                NOT NULL,
    [Duration]         DECIMAL (7, 2)     NULL,
    [Calory]           DECIMAL (7, 2)     NULL,
    [PostProcessedOn]  DATETIMEOFFSET (7) NULL,
    [AdjustedSteps]    INT                NULL,
    [AdjustedDistance] DECIMAL (9, 2)     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO

