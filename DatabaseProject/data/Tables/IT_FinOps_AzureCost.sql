CREATE TABLE [data].[IT_FinOps_AzureCost] (
    [YearMonth]              INT              NOT NULL,
    [Date]                   DATE             NOT NULL,
    [SubscriptionId]         UNIQUEIDENTIFIER NOT NULL,
    [SubscriptionName]       NVARCHAR (255)   NOT NULL,
    [ResourceGroup]          NVARCHAR (255)   NULL,
    [ResourceLocation]       NVARCHAR (255)   NULL,
    [ServiceFamily]          NVARCHAR (255)   NULL,
    [PartNumber]             NVARCHAR (255)   NULL,
    [ProductName]            NVARCHAR (255)   NULL,
    [MeterCategory]          NVARCHAR (255)   NOT NULL,
    [MeterSubCategory]       NVARCHAR (255)   NULL,
    [MeterName]              NVARCHAR (255)   NOT NULL,
    [MeterRegion]            NVARCHAR (255)   NULL,
    [UnitOfMeasure]          NVARCHAR (255)   NULL,
    [UnitPrice]              DECIMAL (36, 18) NULL,
    [Quantity]               DECIMAL (36, 18) NULL,
    [EffectivePrice]         DECIMAL (36, 18) NULL,
    [BillingCurrencyCode]    NVARCHAR (10)    NULL,
    [CostInBillingCurrency]  DECIMAL (36, 18) NULL,
    [ResourceId]             NVARCHAR (1024)  NULL,
    [Tags]                   NVARCHAR (MAX)   NULL,
    [ReservationId]          NVARCHAR (255)   NULL,
    [ReservationName]        NVARCHAR (255)   NULL,
    [ChargeType]             NVARCHAR (255)   NULL,
    [Frequency]              NVARCHAR (255)   NULL,
    [PricingModel]           NVARCHAR (255)   NULL,
    [AvailabilityZone]       NVARCHAR (255)   NULL,
    [BillingPeriodStartDate] DATE             NULL,
    [BillingPeriodEndDate]   DATE             NULL,
    [LastModifiedUtc]        DATETIME2 (3)    NULL,
    [InsertedUtc]            DATETIME2 (3)    NULL
);


GO

