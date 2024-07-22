CREATE TABLE [stg].[RK_DRK_JourneyTravellers] (
    [SourceSystemCode]        NVARCHAR (10)  NULL,
    [SourceSystemEntryRef]    NVARCHAR (200) NULL,
    [JourneyId]               NVARCHAR (50)  NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NULL,
    [TravellerId]             NVARCHAR (100) NULL,
    [CustomerType]            NVARCHAR (50)  NULL,
    [IsMainUser]              BIT            NULL,
    [CustomerPrice]           DECIMAL (18)   NULL
);


GO

