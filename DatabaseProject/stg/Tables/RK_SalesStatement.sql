CREATE TABLE [stg].[RK_SalesStatement] (
    [ServiceProviderID]                    SMALLINT        NULL,
    [ContractorID]                         SMALLINT        NULL,
    [FareReferencePointID]                 BIGINT          NULL,
    [StopReferencePointID]                 BIGINT          NULL,
    [DeviceID]                             INT             NULL,
    [VehicleID]                            INT             NULL,
    [StaffID]                              BIGINT          NULL,
    [StaffName]                            NVARCHAR (255)  NULL,
    [ShiftNumber]                          BIGINT          NULL,
    [ShiftStartDateTime]                   DATETIME2 (0)   NULL,
    [ShiftEndDateTime]                     DATETIME2 (0)   NULL,
    [Period]                               INT             NULL,
    [Consistent]                           SMALLINT        NULL,
    [QuantitySales]                        INT             NULL,
    [QuantityCashTicket]                   INT             NULL,
    [QuantityCancellationOfLastCashTicket] INT             NULL,
    [AmountSales]                          DECIMAL (19, 2) NULL,
    [AmountCashTicket]                     DECIMAL (19, 2) NULL,
    [AmountCancellationOfLastCashTicket]   DECIMAL (19, 2) NULL,
    [AmountTill]                           DECIMAL (19, 2) NULL,
    [CashTicketCancelled]                  NVARCHAR (255)  NULL,
    [AmountSales_]                         INT             NULL,
    [AmountCashTicket_]                    INT             NULL,
    [AmountCancellationOfLastCashTicket_]  INT             NULL,
    [AmountTill_]                          INT             NULL,
    [FilePath]                             NVARCHAR (255)  NULL,
    [FileId]                               INT             NULL
);


GO

