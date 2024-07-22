CREATE TABLE [stg].[ACCT_Settlement_Interval_Daily] (
    [JourneyRef]                    CHAR (18)     NOT NULL,
    [LineNumber]                    INT           NOT NULL,
    [LineDesignation]               NVARCHAR (20) NOT NULL,
    [LineDirectionCode]             INT           NOT NULL,
    [ContractorCode]                NVARCHAR (50) NOT NULL,
    [ContractCode]                  NVARCHAR (50) NOT NULL,
    [ContractorGarageCode]          NVARCHAR (50) NOT NULL,
    [Class]                         NVARCHAR (2)  NOT NULL,
    [FromStop]                      INT           NOT NULL,
    [ToStop]                        INT           NOT NULL,
    [Type]                          NVARCHAR (50) NOT NULL,
    [SettlementCode]                INT           NOT NULL,
    [PlannedDuration]               FLOAT (53)    NOT NULL,
    [PartialDuration]               FLOAT (53)    NOT NULL,
    [IsException]                   INT           NOT NULL,
    [PaymentType]                   NVARCHAR (20) NOT NULL,
    [SourceSystemCode]              NVARCHAR (20) NULL,
    [SourceSystemEntryRef]          NVARCHAR (50) NULL,
    [FirstPlannedSequenceNumber]    INT           NULL,
    [LastPlannedSequenceNumber]     INT           NULL,
    [FirstPlannedDepartureDateTime] DATETIME2 (7) NULL,
    [LastPlannedArrivalDateTime]    DATETIME2 (7) NULL,
    [JourneyNumber]                 INT           NULL,
    [PlannedStopCount]              INT           NULL
);


GO

