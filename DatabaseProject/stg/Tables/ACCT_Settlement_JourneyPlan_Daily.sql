CREATE TABLE [stg].[ACCT_Settlement_JourneyPlan_Daily] (
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
    [SourceSystemCode]              NVARCHAR (20)  NULL,
    [SourceSystemEntryRef]          NVARCHAR (50)  NULL
);


GO

