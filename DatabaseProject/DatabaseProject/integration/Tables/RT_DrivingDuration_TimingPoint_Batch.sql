CREATE TABLE [integration].[RT_DrivingDuration_TimingPoint_Batch] (
    [BatchDate]          DATE          NOT NULL,
    [BatchRowCount]      INT           NULL,
    [BatchTravelTimeSum] INT           NULL,
    [Inserted]           DATETIME2 (0) NULL,
    [Updated]            DATETIME2 (0) NULL,
    CONSTRAINT [PK_RT_DrivingDuration_TimingPoint_Batch] PRIMARY KEY CLUSTERED ([BatchDate] ASC)
);


GO

