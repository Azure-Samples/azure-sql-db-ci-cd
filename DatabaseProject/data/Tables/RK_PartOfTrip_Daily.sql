CREATE TABLE [data].[RK_PartOfTrip_Daily] (
    [TripRef]                       VARCHAR (20)  NOT NULL,
    [TripDate]                      DATE          NOT NULL,
    [MsgReportDate]                 DATETIME2 (0) NOT NULL,
    [CardTransactionSequenceNumber] INT           NOT NULL,
    [TransactionType]               SMALLINT      NULL,
    [ServiceProviderID]             SMALLINT      NULL,
    [ContractorID]                  SMALLINT      NULL,
    [DeviceIDHex]                   VARCHAR (50)  NULL,
    [PartialTripFromStopPointID]    BIGINT        NULL,
    [PartialTripFromStopPointName]  VARCHAR (100) NULL,
    [PartialTripToStopPointID]      BIGINT        NULL,
    [PartialTripToStopPointName]    VARCHAR (100) NULL,
    [RouteID]                       INT           NULL,
    [StartStopPointID]              BIGINT        NULL,
    [EndStopPointID]                BIGINT        NULL,
    [TripType]                      VARCHAR (200) NULL,
    [VehicleID]                     INT           NULL,
    [JourneyRef]                    VARCHAR (32)  NULL,
    [FromJourneyPointRef]           VARCHAR (32)  NULL,
    [ToJourneyPointRef]             VARCHAR (32)  NULL,
    [ToStopPointID]                 INT           NULL,
    [NextMsgReportDate]             DATETIME2 (0) NULL,
    [DeviceID]                      BIGINT        NULL,
    [Inserted]                      DATETIME2 (0) NULL,
    [Updated]                       DATETIME2 (0) NULL,
    [Hash]                          BINARY (32)   NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RK_PartOfTrip_Daily]
    ON [data].[RK_PartOfTrip_Daily]([TripRef] ASC, [TripDate] ASC, [CardTransactionSequenceNumber] ASC)
    INCLUDE([Hash]);


GO

CREATE CLUSTERED COLUMNSTORE INDEX [CSIX_RK_PartOfTrip_Daily]
    ON [data].[RK_PartOfTrip_Daily];


GO

