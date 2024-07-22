CREATE TABLE [data].[RK_DRK_JourneyTravellers] (
    [SourceSystemCode]        NVARCHAR (10)  NOT NULL,
    [SourceSystemEntryRef]    NVARCHAR (121) NOT NULL,
    [JourneyId]               NVARCHAR (36)  NOT NULL,
    [JourneyModifiedDateTime] DATETIME2 (0)  NOT NULL,
    [TravellerId]             NVARCHAR (64)  NOT NULL,
    [CustomerType]            NVARCHAR (50)  NULL,
    [IsMainUser]              BIT            NULL,
    [CustomerPrice]           DECIMAL (18)   NULL,
    [Hash]                    BINARY (32)    NULL,
    [Inserted]                DATETIME2 (0)  NULL,
    [Updated]                 DATETIME2 (0)  NULL,
    CONSTRAINT [PK_RK_DRK_JourneyTravellers_1] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemEntryRef] ASC)
);


GO

