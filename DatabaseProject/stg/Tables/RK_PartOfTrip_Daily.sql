CREATE TABLE [stg].[RK_PartOfTrip_Daily] (
    [TripRef]                       VARCHAR (50)  NULL,
    [TripDate_In]                   VARCHAR (50)  NULL,
    [TripDate]                      DATE          NULL,
    [MsgReportDate_In]              VARCHAR (20)  NULL,
    [MsgReportDate]                 DATETIME2 (0) NULL,
    [CardTransactionSequenceNumber] INT           NULL,
    [TransactionType]               SMALLINT      NULL,
    [ServiceProviderID_In]          VARCHAR (100) NULL,
    [ServiceProviderID]             SMALLINT      NULL,
    [ContractorID_In]               VARCHAR (100) NULL,
    [ContractorID]                  SMALLINT      NULL,
    [DeviceIDHex]                   VARCHAR (6)   NULL,
    [PartialTripFromStopPointID]    BIGINT        NULL,
    [PartialTripFromStopPointName]  VARCHAR (200) NULL,
    [PartialTripToStopPointID]      BIGINT        NULL,
    [PartialTripToStopPointName]    VARCHAR (200) NULL,
    [RouteID]                       BIGINT        NULL,
    [StartStopPointID]              BIGINT        NULL,
    [EndStopPointID]                BIGINT        NULL,
    [TripType]                      VARCHAR (200) NULL,
    [DeviceID]                      INT           NULL,
    [VehicleID]                     INT           NULL,
    [JourneyRef]                    VARCHAR (32)  NULL,
    [FromJourneyPointRef]           VARCHAR (32)  NULL,
    [ToJourneyPointRef]             VARCHAR (32)  NULL,
    [ToStopPointID]                 INT           NULL,
    [NextMsgReportDate]             DATETIME2 (0) NULL
);


GO

CREATE UNIQUE NONCLUSTERED INDEX [BK_RK_PartOfTrip_Daily]
    ON [stg].[RK_PartOfTrip_Daily]([TripRef] ASC, [TripDate] ASC, [CardTransactionSequenceNumber] ASC)
    INCLUDE([MsgReportDate], [TransactionType], [ServiceProviderID], [ContractorID], [DeviceIDHex], [PartialTripFromStopPointID], [PartialTripFromStopPointName], [PartialTripToStopPointID], [PartialTripToStopPointName], [RouteID], [StartStopPointID], [EndStopPointID], [TripType], [DeviceID], [VehicleID], [JourneyRef], [FromJourneyPointRef], [ToJourneyPointRef], [ToStopPointID], [NextMsgReportDate]);


GO

CREATE NONCLUSTERED INDEX [IX_RK_PartOfTrip_Daily]
    ON [stg].[RK_PartOfTrip_Daily]([MsgReportDate] ASC, [TransactionType] ASC, [ServiceProviderID] ASC, [VehicleID] ASC);


GO

