CREATE TABLE [stg].[APC_OTS_CountingReport_Raw] (
    [CountingReportRef]              NVARCHAR (50)  NULL,
    [ReceivedDateTime]               DATETIME2 (3)  NULL,
    [DateTime]                       DATETIME2 (0)  NULL,
    [VehicleRef]                     NVARCHAR (32)  NULL,
    [VehicleIdentificationNumber]    NVARCHAR (100) NULL,
    [SequenceNumber]                 BIGINT         NULL,
    [Duration]                       INT            NULL,
    [Latitude]                       FLOAT (53)     NULL,
    [Longitude]                      FLOAT (53)     NULL,
    [Bearing]                        FLOAT (53)     NULL,
    [GpsHdop]                        FLOAT (53)     NULL,
    [CountingAccuracy]               FLOAT (53)     NULL,
    [BoardingCount]                  INT            NULL,
    [AlightingCount]                 INT            NULL,
    [DoorReports]                    NVARCHAR (MAX) NULL,
    [BoardingJourneyRef]             NVARCHAR (18)  NULL,
    [BoardingJourneyPointRef]        NVARCHAR (22)  NULL,
    [BoardingJourneyPointMatchType]  TINYINT        NULL,
    [AlightingJourneyRef]            NVARCHAR (18)  NULL,
    [AlightingJourneyPointRef]       NVARCHAR (22)  NULL,
    [AlightingJourneyPointMatchType] TINYINT        NULL,
    [MatchedLocationContractorRef]   NVARCHAR (32)  NULL,
    [MatchedLocationGarageRef]       NVARCHAR (32)  NULL,
    [FileNameSource]                 NVARCHAR (24)  NULL,
    [IsReceivedLate]                 BIT            NULL
);


GO

