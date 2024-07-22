CREATE TABLE [fact].[ACCT_Passing_StopPoint] (
    [DateKey]                       INT           NOT NULL,
    [StopPointKey]                  INT           NOT NULL,
    [LineKey]                       INT           NOT NULL,
    [ContractKey]                   INT           NOT NULL,
    [ContractorKey]                 INT           NOT NULL,
    [GarageKey]                     INT           NOT NULL,
    [TypeKey]                       INT           NOT NULL,
    [TransactionTypeKey]            INT           NOT NULL,
    [JourneyRef]                    NVARCHAR (50) NOT NULL,
    [SequenceNumber]                INT           NOT NULL,
    [ArrivalStateFinal]             INT           NULL,
    [DepartureStateFinal]           INT           NULL,
    [FirstAndLastStop]              INT           NULL,
    [IsExtraTrip]                   INT           NULL,
    [IsRequestStop]                 INT           NULL,
    [NumberOfJourneyRefPrStopPoint] INT           NULL,
    [Inserted]                      DATETIME2 (0) NULL,
    [Updated]                       DATETIME2 (0) NULL,
    CONSTRAINT [PK_ACCT_Passing_StopPoint_NY_1] PRIMARY KEY CLUSTERED ([DateKey] ASC, [StopPointKey] ASC, [LineKey] ASC, [ContractKey] ASC, [ContractorKey] ASC, [GarageKey] ASC, [TypeKey] ASC, [TransactionTypeKey] ASC, [JourneyRef] ASC, [SequenceNumber] ASC)
);


GO

CREATE NONCLUSTERED INDEX [IX_ACCT_Passing_StopPoint_DeltaLoad]
    ON [fact].[ACCT_Passing_StopPoint]([Updated] ASC);


GO

