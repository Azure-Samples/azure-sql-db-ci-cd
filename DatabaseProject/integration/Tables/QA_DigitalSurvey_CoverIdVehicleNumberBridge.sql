CREATE TABLE [integration].[QA_DigitalSurvey_CoverIdVehicleNumberBridge] (
    [SourceSystemCode]             NVARCHAR (30)   NOT NULL,
    [SourceSystemEntryRef]         NVARCHAR (200)  NOT NULL,
    [CoverIdVehicleNumberBridgeId] NVARCHAR (200)  NOT NULL,
    [CoverId]                      INT             NULL,
    [TransportMode]                NVARCHAR (10)   NULL,
    [VehicleNumber]                INT             NOT NULL,
    [TrainCode]                    NVARCHAR (50)   NULL,
    [TrainTrackDesignation]        NVARCHAR (200)  NULL,
    [Comment]                      NVARCHAR (1000) NULL,
    [Inserted]                     DATETIME2 (0)   NOT NULL,
    [Updated]                      DATETIME2 (0)   NOT NULL,
    [Hash]                         VARBINARY (32)  NOT NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_CoverIdBusNumberBridge] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

