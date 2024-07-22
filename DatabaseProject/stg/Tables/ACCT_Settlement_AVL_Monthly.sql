CREATE TABLE [stg].[ACCT_Settlement_AVL_Monthly] (
    [JourneyRef]                       CHAR (18)     NOT NULL,
    [FirstRegisteredSequenceNumber]    SMALLINT      NULL,
    [FirstRegisteredDepartureDateTime] DATETIME2 (0) NULL,
    [LastRegisteredSequenceNumber]     SMALLINT      NULL,
    [LastRegisteredArrivalDateTime]    DATETIME2 (0) NULL,
    [ObservedPlannedDuration]          INT           NOT NULL,
    [JourneyPatternPointCount]         SMALLINT      NULL,
    [SourceSystemCode]                 NVARCHAR (20) NULL,
    [SourceSystemEntryRef]             NVARCHAR (50) NULL
);


GO

