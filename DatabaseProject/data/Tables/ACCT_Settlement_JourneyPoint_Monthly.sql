CREATE TABLE [data].[ACCT_Settlement_JourneyPoint_Monthly] (
    [SourceSystemCode]          NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]      NVARCHAR (50)  NULL,
    [JourneyPointRef]           NVARCHAR (50)  NOT NULL,
    [JourneyRef]                CHAR (18)      NOT NULL,
    [OperatingDayDate]          DATE           NULL,
    [SequenceNumber]            SMALLINT       NULL,
    [StopPointNumber]           INT            NULL,
    [StopPointDisplayName]      NVARCHAR (250) NULL,
    [PlannedArrivalDateTime]    DATETIME2 (0)  NULL,
    [PlannedDepartureDateTime]  DATETIME2 (0)  NULL,
    [ObservedArrivalDateTime]   DATETIME2 (0)  NULL,
    [ObservedDepartureDateTime] DATETIME2 (0)  NULL,
    [IsStopPoint]               SMALLINT       NULL,
    [Hash]                      BINARY (32)    NULL,
    [Inserted]                  DATETIME2 (7)  NULL,
    [Updated]                   DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_JourneyPoint_Monthly] PRIMARY KEY CLUSTERED ([JourneyPointRef] ASC)
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_Settlement_JourneyPoint_Monthly_Merge]
    ON [data].[ACCT_Settlement_JourneyPoint_Monthly]([JourneyPointRef] ASC)
    INCLUDE([Hash]);


GO

