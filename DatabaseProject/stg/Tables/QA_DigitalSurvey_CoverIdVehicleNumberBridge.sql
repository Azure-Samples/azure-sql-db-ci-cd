CREATE TABLE [stg].[QA_DigitalSurvey_CoverIdVehicleNumberBridge] (
    [SourceSystemCode]             NVARCHAR (30)   NULL,
    [SourceSystemEntryRef]         NVARCHAR (200)  NULL,
    [CoverIdVehicleNumberBridgeId] NVARCHAR (200)  NOT NULL,
    [CoverId]                      INT             NULL,
    [TransportMode]                NVARCHAR (10)   NULL,
    [VehicleNumber]                INT             NOT NULL,
    [TrainCode]                    NVARCHAR (50)   NULL,
    [TrainTrackDesignation]        NVARCHAR (200)  NULL,
    [Comment]                      NVARCHAR (1000) NULL
);


GO

