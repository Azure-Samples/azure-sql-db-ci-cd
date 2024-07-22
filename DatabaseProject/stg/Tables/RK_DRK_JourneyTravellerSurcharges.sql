CREATE TABLE [stg].[RK_DRK_JourneyTravellerSurcharges] (
    [SourceSystemCode]        NVARCHAR (10)  NULL,
    [SourceSystemEntryRef]    NVARCHAR (200) NULL,
    [JourneyId]               NVARCHAR (50)  NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NULL,
    [TravellerId]             NVARCHAR (100) NULL,
    [SurchargeType]           NVARCHAR (50)  NOT NULL,
    [SurchargeAmount]         DECIMAL (18)   NOT NULL,
    [RevenueCompanyName]      NVARCHAR (50)  NOT NULL,
    [SettlementCompanyName]   NVARCHAR (50)  NOT NULL
);


GO

