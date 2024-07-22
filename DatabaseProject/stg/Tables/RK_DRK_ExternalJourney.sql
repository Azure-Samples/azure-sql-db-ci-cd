CREATE TABLE [stg].[RK_DRK_ExternalJourney] (
    [SourceSystemCode]        NVARCHAR (10)  NULL,
    [SourceSystemEntryRef]    NVARCHAR (100) NULL,
    [ExternalJourneyId]       NVARCHAR (50)  NOT NULL,
    [JourneyId]               NVARCHAR (50)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NOT NULL,
    [CheckoutReason]          NVARCHAR (50)  NULL,
    [CheckInTimeStamp]        DATETIME2 (0)  NULL,
    [CheckOutTimeStamp]       DATETIME2 (0)  NULL
);


GO

