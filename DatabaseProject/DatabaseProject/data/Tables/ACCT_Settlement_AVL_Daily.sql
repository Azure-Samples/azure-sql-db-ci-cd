CREATE TABLE [data].[ACCT_Settlement_AVL_Daily] (
    [SourceSystemCode]                 NVARCHAR (20) NULL,
    [SourceSystemEntryRef]             NVARCHAR (50) NULL,
    [JourneyRef]                       CHAR (18)     NOT NULL,
    [FirstRegisteredSequenceNumber]    SMALLINT      NULL,
    [FirstRegisteredDepartureDateTime] DATETIME2 (0) NULL,
    [LastRegisteredSequenceNumber]     SMALLINT      NULL,
    [LastRegisteredArrivalDateTime]    DATETIME2 (0) NULL,
    [ObservedPlannedDuration]          INT           NULL,
    [JourneyPatternPointCount]         SMALLINT      NULL,
    [Hash]                             BINARY (32)   NULL,
    [Inserted]                         DATETIME2 (7) NULL,
    [Updated]                          DATETIME2 (7) NULL,
    CONSTRAINT [PK_ACCT_Settlement_AVL_Daily] PRIMARY KEY CLUSTERED ([JourneyRef] ASC)
);


GO

