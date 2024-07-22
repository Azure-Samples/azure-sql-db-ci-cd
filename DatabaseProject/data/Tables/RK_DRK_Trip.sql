CREATE TABLE [data].[RK_DRK_Trip] (
    [SourceSystemCode]         NVARCHAR (3)    NOT NULL,
    [SourceSystemEntryRef]     NVARCHAR (56)   NOT NULL,
    [JourneyId]                NVARCHAR (36)   NOT NULL,
    [JourneyModifiedDateTime]  DATETIME2 (0)   NOT NULL,
    [JourneyPrice]             DECIMAL (18, 2) NOT NULL,
    [AmountOfZonesPaid]        NVARCHAR (10)   NOT NULL,
    [FareSetId]                INT             NOT NULL,
    [FareSetName]              NVARCHAR (30)   NULL,
    [JourneyZoneIdsTraveled]   NVARCHAR (MAX)  NOT NULL,
    [JourneyZoneNamesTraveled] NVARCHAR (MAX)  NULL,
    [ProductId]                NVARCHAR (18)   NULL,
    [LoyaltyDiscountLevel]     INT             NULL,
    [JourneyAreaName]          NVARCHAR (30)   NULL,
    [JourneyAreaLevelNumber]   INT             NOT NULL,
    [RevenueSplitRuleNumber]   INT             NOT NULL,
    [CustomerAge]              INT             NULL,
    [JourneyCreatedDateTime]   DATETIME2 (0)   NOT NULL,
    [ExportedDateTime]         DATETIME2 (0)   NULL,
    [Hash]                     BINARY (32)     NOT NULL,
    [Inserted]                 DATETIME2 (0)   NOT NULL,
    [Updated]                  DATETIME2 (0)   NOT NULL,
    CONSTRAINT [PK_RK_DRK_Trip] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

