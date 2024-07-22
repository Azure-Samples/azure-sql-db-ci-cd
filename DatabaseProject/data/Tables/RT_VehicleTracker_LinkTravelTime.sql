CREATE TABLE [data].[RT_VehicleTracker_LinkTravelTime] (
    [JourneyLinkRef]                CHAR (22)     NOT NULL,
    [Time]                          DATETIME2 (0) NULL,
    [LineDesignation]               NVARCHAR (8)  NULL,
    [LineDirectionCode]             NVARCHAR (20) NULL,
    [LinkRef]                       VARCHAR (25)  NOT NULL,
    [LinkEnterDelay]                INT           NULL,
    [LinkExitDelay]                 INT           NULL,
    [LinkTravelTime]                INT           NULL,
    [LinkEnterUtc]                  DATETIME2 (0) NULL,
    [LinkExitUtc]                   DATETIME2 (0) NULL,
    [JourneyRef]                    CHAR (18)     NULL,
    [LinkTravelLength]              REAL          NULL,
    [VehicleId]                     INT           NULL,
    [IsFirstLink]                   BIT           NULL,
    [IsLastLink]                    BIT           NULL,
    [LinkLength]                    REAL          NULL,
    [JourneyPlannedDuration]        INT           NULL,
    [JourneyPlannedDepartureCount]  INT           NULL,
    [JourneyObservedDuration]       INT           NULL,
    [JourneyObservedDepartureCount] INT           NULL,
    [LinkPositionCoverage]          REAL          NULL,
    [OutlierType]                   INT           NULL,
    [LinkTravelTimeNormalized]      INT           NULL
);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RT_VehicleTracker_LinkTravelTime]
    ON [data].[RT_VehicleTracker_LinkTravelTime];


GO

