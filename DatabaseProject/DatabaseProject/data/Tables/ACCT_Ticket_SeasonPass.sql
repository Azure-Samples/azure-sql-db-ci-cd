CREATE TABLE [data].[ACCT_Ticket_SeasonPass] (
    [SeasonPassRef]           NVARCHAR (20)   NOT NULL,
    [SeasonPassNo]            INT             NOT NULL,
    [ProductCode]             NVARCHAR (20)   NOT NULL,
    [SeasonPassTemplateNo]    INT             NOT NULL,
    [ValidityFromDate]        DATE            NOT NULL,
    [ValidityToDate]          DATE            NOT NULL,
    [CreatedDateTime]         DATETIME2 (0)   NOT NULL,
    [CommissionDateTime]      DATETIME2 (0)   NOT NULL,
    [SaleDateTime]            DATETIME2 (0)   NOT NULL,
    [SaleLocationCode]        NVARCHAR (20)   NULL,
    [Price]                   DECIMAL (10, 2) NOT NULL,
    [ReturnTransactionId]     INT             NULL,
    [RateAreaCombinationCode] NVARCHAR (20)   NULL,
    [StartZoneRef]            NVARCHAR (20)   NULL,
    [EndZoneRef]              NVARCHAR (20)   NULL,
    [ZoneCount]               INT             NULL,
    [IsInvalid]               BIT             NOT NULL,
    [InvalidReasonCode]       NVARCHAR (20)   NULL,
    [Inserted]                DATETIME2 (0)   NOT NULL,
    [Updated]                 DATETIME2 (0)   NULL,
    CONSTRAINT [PK_ACCT_Ticket_SeasonPass] PRIMARY KEY CLUSTERED ([SeasonPassRef] ASC)
);


GO

