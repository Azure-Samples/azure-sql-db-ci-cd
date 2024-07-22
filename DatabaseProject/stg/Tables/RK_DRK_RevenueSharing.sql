CREATE TABLE [stg].[RK_DRK_RevenueSharing] (
    [SourceSystemCode]                       NVARCHAR (3)    NULL,
    [SourceSystemEntryRef]                   NVARCHAR (95)   NULL,
    [JourneyId]                              NVARCHAR (36)   NOT NULL,
    [JourneyModifiedDateTime]                DATETIME2 (0)   NOT NULL,
    [ExternalJourneyLegCode]                 NVARCHAR (1)    NULL,
    [ExternalJourneyId]                      NVARCHAR (36)   NULL,
    [LegSplitId]                             SMALLINT        NULL,
    [PreHandlingRuleNumber]                  INT             NULL,
    [RevenueCompanyName]                     NVARCHAR (14)   NULL,
    [SettlementCompanyName]                  NVARCHAR (14)   NULL,
    [RevenueSharingOriginStopPointId]        NVARCHAR (9)    NULL,
    [RevenueSharingOriginStopPointName]      NVARCHAR (100)  NULL,
    [RevenueSharingOriginZoneId]             NVARCHAR (14)   NULL,
    [RevenueSharingOriginSubArea]            NVARCHAR (17)   NULL,
    [RevenueSharingDestinationStopPointId]   NVARCHAR (9)    NULL,
    [RevenueSharingDestinationStopPointName] NVARCHAR (100)  NULL,
    [RevenueSharingDestinationZoneId]        NVARCHAR (14)   NULL,
    [RevenueSharingDestinationSubArea]       NVARCHAR (17)   NULL,
    [ZoneShare]                              DECIMAL (18, 2) NULL,
    [ZoneDistanceNumber]                     INT             NULL,
    [ZonePriceAreaName]                      NVARCHAR (17)   NULL,
    [ZonePriceAreaLevelNumber]               INT             NULL,
    [ZonePrice]                              DECIMAL (18, 2) NULL,
    [JourneyLegShare]                        DECIMAL (18, 2) NULL,
    [PartPrice]                              DECIMAL (18, 2) NULL,
    [PartOffPeakDiscount]                    DECIMAL (18, 2) NULL,
    [RevenueSharedDateTime]                  DATETIME2 (0)   NULL
);


GO

