CREATE TABLE [fact].[ACCT_RevenueSharing_TicketSale] (
    [TicketSaleKey]            INT             IDENTITY (1, 1) NOT NULL,
    [DateKey]                  INT             NOT NULL,
    [OriginTariffZoneKey]      INT             NOT NULL,
    [DestinationTariffZoneKey] INT             NOT NULL,
    [JourneyPatternPointKey]   INT             NULL,
    [TicketTypeKey]            INT             NOT NULL,
    [SharingMethodKey]         INT             NOT NULL,
    [FareSetKey]               INT             NOT NULL,
    [SourceSystemCode]         NVARCHAR (20)   NOT NULL,
    [SourceSystemEntryRef]     NVARCHAR (255)  NOT NULL,
    [TicketTypeCode]           NVARCHAR (20)   NULL,
    [OriginTariffZoneRef]      NVARCHAR (20)   NULL,
    [OriginRateAreaCode]       NVARCHAR (20)   NULL,
    [DestinationTariffZoneRef] NVARCHAR (20)   NULL,
    [DestinationRateAreaCode]  NVARCHAR (20)   NULL,
    [SharingMethodCode]        NVARCHAR (20)   NULL,
    [FareSetCode]              NVARCHAR (20)   NULL,
    [ZoneCount]                INT             NULL,
    [AdultCount]               DECIMAL (18, 2) NULL,
    [ChildCount]               DECIMAL (18, 2) NULL,
    [PassengerCount]           DECIMAL (18, 2) NULL,
    [Amount]                   DECIMAL (18, 2) NOT NULL,
    [JourneyRef]               CHAR (18)       NULL,
    [JourneyPointRef]          CHAR (22)       NULL,
    [MediaTypeKey]             INT             NULL,
    [SalesChannelKey]          INT             NULL,
    [RevenueTypeKey]           INT             NULL,
    [PassengerTypeKey]         INT             NULL,
    [MediaTypeCode]            NVARCHAR (20)   NULL,
    [SalesChannelCode]         NVARCHAR (20)   NULL,
    [RevenueTypeCode]          NVARCHAR (20)   NULL,
    [PassengerTypeCode]        NVARCHAR (20)   NULL,
    [PaidZoneCount]            INT             NULL,
    [ValidityDays]             DECIMAL (18, 2) NULL,
    [SourceSystemProductRef]   NVARCHAR (255)  NULL,
    [TimeKey]                  INT             NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_TicketSale] PRIMARY KEY CLUSTERED ([TicketSaleKey] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_ACCT_RevenueSharing_TicketSale]
    ON [fact].[ACCT_RevenueSharing_TicketSale]([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC, [FareSetKey] ASC);


GO

