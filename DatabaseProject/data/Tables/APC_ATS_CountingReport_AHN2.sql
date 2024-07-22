CREATE TABLE [data].[APC_ATS_CountingReport_AHN2] (
    [CountingReportRef]              NVARCHAR (50) NOT NULL,
    [DateTime]                       DATETIME2 (3) NULL,
    [VehicleRef]                     NVARCHAR (32) NULL,
    [SequenceNumber]                 BIGINT        NULL,
    [Duration]                       INT           NULL,
    [Latitude]                       FLOAT (53)    NULL,
    [Longitude]                      FLOAT (53)    NULL,
    [Bearing]                        FLOAT (53)    NULL,
    [GpsHdop]                        FLOAT (53)    NULL,
    [CountingAccuracy]               FLOAT (53)    NULL,
    [BoardingCount]                  INT           NULL,
    [AlightingCount]                 INT           NULL,
    [ReceivedDateTime]               DATETIME2 (3) NULL,
    [ApiKeyOwner]                    NVARCHAR (32) NULL,
    [AvlDateTime]                    DATETIME2 (3) NULL,
    [AvlLatitude]                    FLOAT (53)    NULL,
    [AvlLongitude]                   FLOAT (53)    NULL,
    [AvlSpeed]                       FLOAT (53)    NULL,
    [AvlGpsFixType]                  TINYINT       NULL,
    [AvlGpsQuality]                  TINYINT       NULL,
    [AvlDistance]                    FLOAT (53)    NULL,
    [BoardingJourneyRef]             CHAR (18)     NULL,
    [BoardingJourneyPointRef]        CHAR (22)     NULL,
    [BoardingJourneyPointMatchType]  TINYINT       NULL,
    [AlightingJourneyRef]            CHAR (18)     NULL,
    [AlightingJourneyPointRef]       CHAR (22)     NULL,
    [AlightingJourneyPointMatchType] TINYINT       NULL,
    [MatchedLocationContractorRef]   NVARCHAR (32) NULL,
    [MatchedLocationGarageRef]       NVARCHAR (32) NULL,
    CONSTRAINT [PK_APC_ATS_CountingReport_AHN2] PRIMARY KEY CLUSTERED ([CountingReportRef] ASC)
);


GO

