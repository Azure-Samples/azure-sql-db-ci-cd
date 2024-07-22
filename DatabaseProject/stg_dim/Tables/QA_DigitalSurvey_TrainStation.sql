CREATE TABLE [stg_dim].[QA_DigitalSurvey_TrainStation] (
    [SourceSystemCode]           NVARCHAR (30)  NULL,
    [SourceSystemEntryRef]       NVARCHAR (251) NULL,
    [TrainStationId]             NVARCHAR (251) NULL,
    [TrainStationName]           NVARCHAR (100) NULL,
    [TrainStationSequenceNumber] INT            NULL,
    [TrainStationLatitude]       DECIMAL (9, 6) NULL,
    [TrainStationLongitude]      DECIMAL (9, 6) NULL,
    [TrainTrackDesignation]      NVARCHAR (10)  NULL,
    [TrainTrackName]             NVARCHAR (150) NULL,
    [TrainTrackDisplayName]      NVARCHAR (255) NULL,
    [TrainGarageName]            NVARCHAR (50)  NULL,
    [RegionCode]                 NVARCHAR (10)  NULL,
    [RegionName]                 NVARCHAR (50)  NULL
);


GO

