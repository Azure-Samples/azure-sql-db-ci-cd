CREATE TABLE [data].[RK_DRK_JourneyTravellerDiscounts] (
    [SourceSystemCode]        NVARCHAR (11)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (121) NOT NULL,
    [JourneyId]               NVARCHAR (36)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NOT NULL,
    [TravellerId]             NVARCHAR (64)  NOT NULL,
    [DiscountType]            NVARCHAR (50)  NOT NULL,
    [DiscountAmount]          DECIMAL (18)   NOT NULL,
    [Hash]                    BINARY (32)    NULL,
    [Inserted]                DATETIME2 (0)  NULL,
    [Updated]                 DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RK_DRK_JourneyTravellerDiscounts_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

