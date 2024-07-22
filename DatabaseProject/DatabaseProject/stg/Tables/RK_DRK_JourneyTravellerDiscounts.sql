CREATE TABLE [stg].[RK_DRK_JourneyTravellerDiscounts] (
    [SourceSystemCode]        NVARCHAR (10)  NULL,
    [SourceSystemEntryRef]    NVARCHAR (200) NULL,
    [JourneyId]               NVARCHAR (50)  NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NULL,
    [TravellerId]             NVARCHAR (100) NULL,
    [DiscountType]            NVARCHAR (50)  NULL,
    [DiscountAmount]          DECIMAL (18)   NULL
);


GO

