CREATE TABLE [integration].[ACCT_RevenueSharing_ProductMap] (
    [SourceSystemCode]        NVARCHAR (20)   NOT NULL,
    [SourceSystemProductRef]  NVARCHAR (255)  NOT NULL,
    [ValidFromDate]           DATETIME2 (7)   NOT NULL,
    [ValidToDate]             DATETIME2 (7)   NULL,
    [PassengerTypeCode]       NVARCHAR (20)   NULL,
    [TicketTypeCode]          NVARCHAR (20)   NULL,
    [ZoneCount]               INT             NULL,
    [UnitPrice]               DECIMAL (18, 2) NULL,
    [RevenueTypeCode]         NVARCHAR (20)   NULL,
    [MetaDataSource]          VARCHAR (255)   NULL,
    [MetaDataUpdateTimeStamp] DATETIME2 (7)   NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_PassengerTypeMap] PRIMARY KEY CLUSTERED ([SourceSystemCode] ASC, [SourceSystemProductRef] ASC, [ValidFromDate] ASC)
);


GO

