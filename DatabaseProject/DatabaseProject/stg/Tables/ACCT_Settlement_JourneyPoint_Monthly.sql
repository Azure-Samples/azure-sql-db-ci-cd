CREATE TABLE [stg].[ACCT_Settlement_JourneyPoint_Monthly] (
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
    [SourceSystemCode]          NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]      NVARCHAR (50)  NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [UQ_ACCT_Settlement_JourneyPoint_Monthly_Merge]
    ON [stg].[ACCT_Settlement_JourneyPoint_Monthly]([JourneyPointRef] ASC)
    INCLUDE([JourneyRef], [OperatingDayDate], [SequenceNumber], [StopPointNumber], [StopPointDisplayName], [PlannedArrivalDateTime], [PlannedDepartureDateTime], [ObservedArrivalDateTime], [ObservedDepartureDateTime], [SourceSystemCode], [SourceSystemEntryRef]);


GO

