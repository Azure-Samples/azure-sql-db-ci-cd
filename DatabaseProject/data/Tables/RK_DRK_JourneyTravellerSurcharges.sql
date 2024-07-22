CREATE TABLE [data].[RK_DRK_JourneyTravellerSurcharges] (
    [SourceSystemCode]        NVARCHAR (10)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (121) NOT NULL,
    [JourneyId]               NVARCHAR (36)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NOT NULL,
    [TravellerId]             NVARCHAR (64)  NOT NULL,
    [SurchargeType]           NVARCHAR (50)  NOT NULL,
    [SurchargeAmount]         DECIMAL (18)   NOT NULL,
    [RevenueCompanyName]      NVARCHAR (50)  NOT NULL,
    [SettlementCompanyName]   NVARCHAR (50)  NOT NULL,
    [Hash]                    BINARY (32)    NULL,
    [Inserted]                DATETIME2 (0)  NULL,
    [Updated]                 DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RK_DRK_JourneyTravellerSurcharges_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

