CREATE TABLE [integration].[QA_DigitalSurvey_TrainTrackSrcDesignationBridge] (
    [SourceSystemCode]      NVARCHAR (30)  NOT NULL,
    [TrainTrackSource]      NVARCHAR (100) NOT NULL,
    [TrainTrackDesignation] NVARCHAR (20)  NOT NULL,
    [Inserted]              DATETIME2 (0)  NOT NULL,
    [Updated]               DATETIME2 (0)  NOT NULL,
    [Hash]                  VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_TrainTrackSrcDesignationBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [TrainTrackSource] ASC)
);


GO

