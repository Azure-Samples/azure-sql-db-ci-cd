CREATE TABLE [stg].[ACCT_WebShop_Ticket] (
    [TicketRef]               INT             NULL,
    [OrderRef]                INT             NULL,
    [OrderNumber]             NVARCHAR (50)   NULL,
    [Date]                    DATE            NULL,
    [OrderLineNumber]         BIGINT          NULL,
    [ItemNo]                  NVARCHAR (20)   NULL,
    [Quantity]                INT             NULL,
    [Price]                   DECIMAL (19, 4) NULL,
    [Total]                   DECIMAL (19, 4) NULL,
    [Description]             NVARCHAR (512)  NULL,
    [IsSelfPrint]             BIT             NULL,
    [JourneyJson]             NVARCHAR (4000) NULL,
    [ZoneJson]                NVARCHAR (4000) NULL,
    [PeriodJson]              NVARCHAR (4000) NULL,
    [RateAreaCombinationCode] NVARCHAR (20)   NULL,
    [StartZoneRef]            NVARCHAR (20)   NULL,
    [EndZoneRef]              NVARCHAR (20)   NULL,
    [ZoneCount]               INT             NULL,
    [PaidZoneCount]           INT             NULL,
    [PeriodStartDate]         DATE            NULL,
    [PeriodEndDate]           DATE            NULL
);


GO

