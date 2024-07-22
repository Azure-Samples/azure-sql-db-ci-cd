CREATE TABLE [data].[ACCT_Settlement_JourneyPlan_Daily] (
    [SourceSystemCode]              NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]          NVARCHAR (50)  NULL,
    [JourneyRef]                    CHAR (18)      NOT NULL,
    [OperatingDayDate]              DATE           NULL,
    [TransportModeCode]             NVARCHAR (20)  NULL,
    [LineDirectionCode]             NVARCHAR (20)  NULL,
    [LineDirectionName]             NVARCHAR (250) NULL,
    [LineDesignation]               VARCHAR (8)    NULL,
    [LineNumber]                    INT            NULL,
    [ContractorCode]                NVARCHAR (20)  NULL,
    [ContractorName]                NVARCHAR (250) NULL,
    [ContractCode]                  NVARCHAR (20)  NULL,
    [ContractorGarageCode]          NVARCHAR (50)  NULL,
    [JourneyPatternId]              NVARCHAR (16)  NULL,
    [FirstPlannedSequenceNumber]    INT            NULL,
    [FirstPlannedDepartureDateTime] DATETIME       NULL,
    [LastPlannedSequenceNumber]     SMALLINT       NULL,
    [LastPlannedArrivalDateTime]    DATETIME       NULL,
    [JourneyNumber]                 INT            NULL,
    [PlannedStopCount]              INT            NULL,
    [Hash]                          BINARY (32)    NULL,
    [Inserted]                      DATETIME2 (7)  NULL,
    [Updated]                       DATETIME2 (7)  NULL,
    CONSTRAINT [PK_ACCT_Settlement_JourneyPlan_Daily] PRIMARY KEY CLUSTERED ([JourneyRef] ASC)
);


GO

