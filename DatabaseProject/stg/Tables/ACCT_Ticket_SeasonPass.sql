CREATE TABLE [stg].[ACCT_Ticket_SeasonPass] (
    [SeasonPassRef]           NVARCHAR (20)   NULL,
    [SeasonPassNo]            INT             NULL,
    [ProductCode]             NVARCHAR (20)   NULL,
    [SeasonPassTemplateNo]    INT             NULL,
    [ValidityFromDate]        DATE            NULL,
    [ValidityToDate]          DATE            NULL,
    [Zones]                   NVARCHAR (1000) NULL,
    [CreatedDateTime]         DATETIME2 (0)   NULL,
    [CommissionDateTime]      DATETIME2 (0)   NULL,
    [SaleDateTime]            DATETIME2 (0)   NULL,
    [SaleLocationCode]        NVARCHAR (20)   NULL,
    [Price]                   DECIMAL (10, 2) NULL,
    [ReturnTransactionId]     INT             NULL,
    [RateAreaCombinationCode] NVARCHAR (20)   NULL,
    [StartZoneRef]            NVARCHAR (20)   NULL,
    [EndZoneRef]              NVARCHAR (20)   NULL,
    [ZoneCount]               INT             NULL,
    [IsInvalid]               BIT             NULL,
    [InvalidReasonCode]       NVARCHAR (20)   NULL
);


GO

