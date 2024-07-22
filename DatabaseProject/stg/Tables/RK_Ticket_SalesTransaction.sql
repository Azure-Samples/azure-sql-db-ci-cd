CREATE TABLE [stg].[RK_Ticket_SalesTransaction] (
    [DWH_ID]            INT      NOT NULL,
    [Inserted]          DATETIME NOT NULL,
    [StaffID]           INT      NOT NULL,
    [MsgReportDate]     DATETIME NOT NULL,
    [TransactionType]   TINYINT  NOT NULL,
    [TransactionStatus] TINYINT  NOT NULL,
    [FareAuthorityID]   SMALLINT NULL,
    [PaymentMeansType]  TINYINT  NOT NULL,
    [PaymentAmount]     INT      NOT NULL,
    [TransactionValue]  INT      NOT NULL,
    [FeeValue]          INT      NOT NULL,
    [MediaType]         TINYINT  NOT NULL,
    [PartitionField]    INT      NOT NULL
);


GO

