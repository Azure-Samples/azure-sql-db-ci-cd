CREATE TABLE [data].[RK_DRK_RevenueSharing] (
    [SourceSystemCode]                       NVARCHAR (3)    NOT NULL,
    [SourceSystemEntryRef]                   NVARCHAR (95)   NOT NULL,
    [JourneyId]                              NVARCHAR (36)   NOT NULL,
    [JourneyModifiedDateTime]                DATETIME2 (0)   NOT NULL,
    [ExternalJourneyLegCode]                 NVARCHAR (1)    NOT NULL,
    [ExternalJourneyId]                      NVARCHAR (36)   NOT NULL,
    [LegSplitId]                             SMALLINT        NULL,
    [PreHandlingRuleNumber]                  INT             NULL,
    [RevenueCompanyName]                     NVARCHAR (14)   NULL,
    [SettlementCompanyName]                  NVARCHAR (14)   NULL,
    [RevenueSharingOriginStopPointId]        NVARCHAR (9)    NULL,
    [RevenueSharingOriginStopPointName]      NVARCHAR (100)  NOT NULL,
    [RevenueSharingOriginZoneId]             NVARCHAR (14)   NULL,
    [RevenueSharingOriginSubArea]            NVARCHAR (17)   NULL,
    [RevenueSharingDestinationStopPointId]   NVARCHAR (9)    NULL,
    [RevenueSharingDestinationStopPointName] NVARCHAR (100)  NOT NULL,
    [RevenueSharingDestinationZoneId]        NVARCHAR (14)   NULL,
    [RevenueSharingDestinationSubArea]       NVARCHAR (17)   NULL,
    [ZoneShare]                              DECIMAL (18, 2) NULL,
    [ZoneDistanceNumber]                     INT             NOT NULL,
    [ZonePriceAreaName]                      NVARCHAR (17)   NOT NULL,
    [ZonePriceAreaLevelNumber]               INT             NULL,
    [ZonePrice]                              DECIMAL (18, 2) NULL,
    [JourneyLegShare]                        DECIMAL (18, 2) NULL,
    [PartPrice]                              DECIMAL (18, 2) NULL,
    [PartOffPeakDiscount]                    DECIMAL (18, 2) NULL,
    [Hash]                                   BINARY (32)     NULL,
    [Inserted]                               DATETIME2 (0)   NULL,
    [Updated]                                DATETIME2 (0)   NULL,
    CONSTRAINT [PK_RK_DRK_RevenueSharing] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

