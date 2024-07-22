CREATE TABLE [stg].[RK_DRK_PartofTrip] (
    [SourceSystemCode]                 NVARCHAR (3)  NULL,
    [SourceSystemEntryRef]             NVARCHAR (95) NULL,
    [JourneyId]                        NVARCHAR (36) NULL,
    [JourneyModifiedDateTime]          DATETIME2 (0) NULL,
    [ExternalJourneyLegCode]           NVARCHAR (1)  NULL,
    [ExternalJourneyId]                NVARCHAR (36) NULL,
    [LegOriginStopPointId]             NVARCHAR (9)  NULL,
    [LegOriginStopPointName]           NVARCHAR (50) NULL,
    [LegOriginStopPointTimestamp]      DATETIME2 (0) NULL,
    [LegOriginObservedTimestamp]       DATETIME2 (0) NULL,
    [LegOriginZoneId]                  NVARCHAR (14) NULL,
    [LegDestinationStopPointId]        NVARCHAR (9)  NULL,
    [LegDestinationStopPointName]      NVARCHAR (50) NULL,
    [LegDestinationStopPointTimestamp] DATETIME2 (0) NULL,
    [LegDestinationObservedTimestamp]  DATETIME2 (0) NULL,
    [LegDestinationZoneId]             NVARCHAR (14) NULL,
    [OperatingCompany]                 NVARCHAR (20) NULL,
    [RouteDisplayNumber]               NVARCHAR (4)  NULL,
    [DivisionNumber]                   NVARCHAR (16) NULL,
    [TripId]                           NVARCHAR (9)  NULL,
    [ModeOfTransportationId]           NVARCHAR (3)  NULL,
    [ModeOfTransportationName]         NVARCHAR (11) NULL,
    [IsHailing]                        BIT           NULL,
    [LegDistance]                      FLOAT (53)    NULL
);


GO

