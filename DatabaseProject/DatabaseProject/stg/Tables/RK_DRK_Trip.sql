CREATE TABLE [stg].[RK_DRK_Trip] (
    [SourceSystemCode]         NVARCHAR (3)    NULL,
    [SourceSystemEntryRef]     NVARCHAR (56)   NULL,
    [JourneyId]                NVARCHAR (36)   NOT NULL,
    [JourneyModifiedDateTime]  DATETIME2 (0)   NOT NULL,
    [JourneyPrice]             DECIMAL (18, 2) NULL,
    [AmountOfZonesPaid]        NVARCHAR (10)   NULL,
    [FareSetId]                INT             NULL,
    [FareSetName]              NVARCHAR (30)   NULL,
    [JourneyZoneIdsTraveled]   NVARCHAR (MAX)  NULL,
    [JourneyZoneNamesTraveled] NVARCHAR (MAX)  NULL,
    [ProductID]                NVARCHAR (18)   NULL,
    [LoyaltyDiscountLevel]     INT             NULL,
    [JourneyAreaName]          NVARCHAR (30)   NULL,
    [JourneyAreaLevelNumber]   INT             NULL,
    [RevenueSplitRuleNumber]   INT             NULL,
    [CustomerAge]              INT             NULL,
    [JourneyCreatedDateTime]   DATETIME2 (0)   NULL,
    [ExportedDateTime]         DATETIME2 (0)   NULL
);


GO

