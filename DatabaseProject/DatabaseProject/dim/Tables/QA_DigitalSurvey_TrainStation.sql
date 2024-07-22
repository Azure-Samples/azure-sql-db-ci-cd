CREATE TABLE [dim].[QA_DigitalSurvey_TrainStation] (
    [TrainStationKey]            INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystemCode]           NVARCHAR (30)  NOT NULL,
    [SourceSystemEntryRef]       NVARCHAR (200) NOT NULL,
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
    [RegionName]                 NVARCHAR (50)  NULL,
    [Inserted]                   DATETIME2 (0)  NOT NULL,
    [Updated]                    DATETIME2 (0)  NOT NULL,
    [Hash]                       VARBINARY (32) NOT NULL,
    CONSTRAINT [PK_QA_DigitalSurvey_TrainStation] PRIMARY KEY CLUSTERED ([TrainStationKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_QA_DigitalSurvey_TrainStation_Merge]
    ON [dim].[QA_DigitalSurvey_TrainStation]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
    INCLUDE([TrainStationId], [TrainStationName], [TrainStationSequenceNumber], [TrainStationLatitude], [TrainStationLongitude], [TrainTrackName], [TrainGarageName], [RegionCode], [RegionName], [TrainTrackDesignation]);


GO

