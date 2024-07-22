CREATE TABLE [data].[RK_SalesStatement] (
    [Id]                                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [FileId]                               INT             NOT NULL,
    [Inserted]                             DATETIME        NOT NULL,
    [Updated]                              DATETIME        NULL,
    [ServiceProviderID]                    SMALLINT        NOT NULL,
    [ContractorID]                         SMALLINT        NOT NULL,
    [FareReferencePointID]                 BIGINT          NULL,
    [StopReferencePointID]                 BIGINT          NULL,
    [DeviceID]                             INT             NOT NULL,
    [VehicleID]                            INT             NULL,
    [StaffID]                              BIGINT          NULL,
    [StaffName]                            NVARCHAR (255)  NULL,
    [ShiftNumber]                          BIGINT          NOT NULL,
    [ShiftStartDateTime]                   DATETIME        NOT NULL,
    [ShiftEndDateTime]                     DATETIME        NOT NULL,
    [Period]                               INT             NULL,
    [Consistent]                           SMALLINT        NULL,
    [QuantitySales]                        INT             NOT NULL,
    [QuantityCashTicket]                   INT             NOT NULL,
    [QuantityCancellationOfLastCashTicket] INT             NOT NULL,
    [AmountSales]                          DECIMAL (19, 2) NOT NULL,
    [AmountCashTicket]                     DECIMAL (19, 2) NOT NULL,
    [AmountCancellationOfLastCashTicket]   DECIMAL (19, 2) NOT NULL,
    [AmountTill]                           DECIMAL (19, 2) NOT NULL,
    [CashTicketCancelled]                  NVARCHAR (255)  NULL,
    CONSTRAINT [PK_RK_SalesStatement] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [BK_RK_SalesStatement] UNIQUE NONCLUSTERED ([DeviceID] ASC, [ShiftNumber] ASC, [ShiftStartDateTime] ASC)
);


GO

