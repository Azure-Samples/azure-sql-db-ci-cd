CREATE TABLE [data].[RK_DRK_ExternalJourney] (
    [SourceSystemCode]        NVARCHAR (11)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (121) NOT NULL,
    [ExternalJourneyId]       NVARCHAR (36)  NOT NULL,
    [JourneyId]               NVARCHAR (36)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NOT NULL,
    [CheckoutReason]          NVARCHAR (50)  NULL,
    [CheckInTimeStamp]        DATETIME2 (0)  NULL,
    [CheckOutTimeStamp]       DATETIME2 (0)  NULL,
    [Hash]                    BINARY (32)    NULL,
    [Inserted]                DATETIME2 (0)  NULL,
    [Updated]                 DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RK_DRK_ExternalJourney_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

