CREATE TABLE [stg_fact].[ACCT_RevenueSharing_TicketSaleDistributed] (
    [DateKey]                  INT              NOT NULL,
    [TicketTypeKey]            INT              NOT NULL,
    [MediaTypeKey]             INT              NOT NULL,
    [SalesChannelKey]          INT              CONSTRAINT [DF_ACCT_RevenueSharing_TicketSaleDistributed_SalesChannelKey] DEFAULT ((-1)) NOT NULL,
    [RevenueTypeKey]           INT              NOT NULL,
    [SharingMethodKey]         INT              NOT NULL,
    [FareSetKey]               INT              NOT NULL,
    [PassengerTypeKey]         INT              NOT NULL,
    [Date]                     DATE             NULL,
    [TicketTypeCode]           NVARCHAR (20)    NULL,
    [MediaTypeCode]            NVARCHAR (20)    NULL,
    [SalesChannelCode]         NVARCHAR (20)    NULL,
    [RevenueTypeCode]          NVARCHAR (20)    NULL,
    [SharingMethodCode]        NVARCHAR (20)    NULL,
    [FareSetCode]              NVARCHAR (20)    NULL,
    [PassengerTypeCode]        NVARCHAR (20)    NULL,
    [PaidZoneCount]            INT              NULL,
    [ZoneCount]                INT              NULL,
    [PassengerCount]           NUMERIC (28, 10) NULL,
    [Amount]                   NUMERIC (28, 10) NULL,
    [SourceSystemCode]         NVARCHAR (20)    NOT NULL,
    [SourceSystemEntryRef]     NVARCHAR (255)   NOT NULL,
    [TicketSaleDistributedKey] INT              IDENTITY (1, 1) NOT NULL,
    [ValidityDays]             DECIMAL (18, 2)  NULL,
    [SourceSystemProductRef]   NVARCHAR (255)   NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_TicketSaleDistributed] PRIMARY KEY CLUSTERED ([TicketSaleDistributedKey] ASC)
);


GO

