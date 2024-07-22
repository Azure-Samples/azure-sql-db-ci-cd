CREATE TABLE [data].[RK_DRK_PartofTrip] (
    [SourceSystemCode]                 NVARCHAR (3)  NOT NULL,
    [SourceSystemEntryRef]             NVARCHAR (95) NOT NULL,
    [JourneyId]                        NVARCHAR (36) NOT NULL,
    [JourneyModifiedDateTime]          DATETIME2 (0) NOT NULL,
    [ExternalJourneyLegCode]           NVARCHAR (1)  NOT NULL,
    [ExternalJourneyId]                NVARCHAR (36) NOT NULL,
    [LegOriginStopPointId]             NVARCHAR (9)  NOT NULL,
    [LegOriginStopPointName]           NVARCHAR (50) NULL,
    [LegOriginStopPointTimestamp]      DATETIME2 (0) NOT NULL,
    [LegOriginObservedTimestamp]       DATETIME2 (0) NULL,
    [LegOriginZoneId]                  NVARCHAR (14) NOT NULL,
    [LegDestinationStopPointId]        NVARCHAR (9)  NOT NULL,
    [LegDestinationStopPointName]      NVARCHAR (50) NULL,
    [LegDestinationStopPointTimestamp] DATETIME2 (0) NOT NULL,
    [LegDestinationObservedTimestamp]  DATETIME2 (0) NULL,
    [LegDestinationZoneId]             NVARCHAR (14) NOT NULL,
    [OperatingCompany]                 NVARCHAR (20) NOT NULL,
    [RouteDisplayNumber]               NVARCHAR (4)  NOT NULL,
    [DivisionNumber]                   NVARCHAR (16) NULL,
    [TripId]                           NVARCHAR (9)  NULL,
    [ModeOfTransportationId]           NVARCHAR (3)  NOT NULL,
    [ModeOfTransportationName]         NVARCHAR (11) NULL,
    [IsHailing]                        BIT           NOT NULL,
    [LegDistance]                      FLOAT (53)    NULL,
    [Hash]                             BINARY (32)   NOT NULL,
    [Inserted]                         DATETIME2 (0) NOT NULL,
    [Updated]                          DATETIME2 (0) NOT NULL,
    CONSTRAINT [PK_RK_DRK_PartofTrip_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

