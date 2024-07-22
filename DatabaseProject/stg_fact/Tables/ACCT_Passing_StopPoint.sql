CREATE TABLE [stg_fact].[ACCT_Passing_StopPoint] (
    [DateKey]                       INT           NULL,
    [StopPointKey]                  INT           NULL,
    [LineKey]                       INT           NULL,
    [ContractKey]                   INT           NULL,
    [ContractorKey]                 INT           NULL,
    [GarageKey]                     INT           NULL,
    [TypeKey]                       INT           NULL,
    [TransactionTypeKey]            INT           NULL,
    [OperatingDayDate]              DATE          NULL,
    [TrackingSourceSystemCode]      NVARCHAR (20) NULL,
    [JourneyRef]                    NVARCHAR (50) NULL,
    [LineNumber]                    INT           NULL,
    [StopPointNumber]               INT           NULL,
    [SequenceNumber]                INT           NULL,
    [ArrivalStateFinal]             INT           NULL,
    [DepartureStateFinal]           INT           NULL,
    [ContractCode]                  NVARCHAR (20) NULL,
    [ContractorCode]                NVARCHAR (20) NULL,
    [GarageCode]                    NVARCHAR (20) NULL,
    [TransactionType]               INT           NULL,
    [FirstAndLastStop]              INT           NULL,
    [IsExtraTrip]                   INT           NULL,
    [IsRequestStop]                 INT           NULL,
    [NumberOfJourneyRefPrStopPoint] INT           NULL
);


GO

