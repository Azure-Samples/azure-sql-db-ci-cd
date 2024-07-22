CREATE TABLE [data].[ACCT_Settlement_Interval_Monthly] (
    [SourceSystemCode]              NVARCHAR (20) NULL,
    [SourceSystemEntryRef]          NVARCHAR (50) NULL,
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
    [Hash]                          BINARY (32)   NULL,
    [Inserted]                      DATETIME2 (7) NULL,
    [Updated]                       DATETIME2 (7) NULL,
    [FirstPlannedSequenceNumber]    INT           NULL,
    [LastPlannedSequenceNumber]     INT           NULL,
    [FirstPlannedDepartureDateTime] DATETIME2 (7) NULL,
    [LastPlannedArrivalDateTime]    DATETIME2 (7) NULL,
    [JourneyNumber]                 INT           NULL,
    [PlannedStopCount]              INT           NULL,
    CONSTRAINT [PK_ACCT_Settlement_Interval_Monthly] PRIMARY KEY CLUSTERED ([JourneyRef] ASC, [FromStop] ASC, [ToStop] ASC)
);


GO

