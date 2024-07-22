CREATE TABLE [data].[ACCT_WebShop_Ticket] (
    [TicketRef]               NVARCHAR (20)   NOT NULL,
    [OrderRef]                NVARCHAR (20)   NOT NULL,
    [OrderNumber]             NVARCHAR (50)   NULL,
    [Date]                    DATE            NOT NULL,
    [OrderLineNumber]         INT             NOT NULL,
    [ItemNo]                  NVARCHAR (20)   NULL,
    [Quantity]                INT             NULL,
    [Price]                   DECIMAL (19, 4) NULL,
    [Total]                   DECIMAL (19, 4) NULL,
    [Description]             NVARCHAR (512)  NULL,
    [IsSelfPrint]             BIT             NULL,
    [RateAreaCombinationCode] NVARCHAR (20)   NULL,
    [StartZoneRef]            NVARCHAR (20)   NULL,
    [EndZoneRef]              NVARCHAR (20)   NULL,
    [ZoneCount]               INT             NULL,
    [PaidZoneCount]           INT             NULL,
    [PeriodStartDate]         DATE            NULL,
    [PeriodEndDate]           DATE            NULL,
    [Inserted]                DATETIME2 (0)   NOT NULL,
    [Updated]                 DATETIME2 (0)   NULL,
    CONSTRAINT [PK_ACCT_WebShop_Ticket] PRIMARY KEY CLUSTERED ([TicketRef] ASC)
);


GO

