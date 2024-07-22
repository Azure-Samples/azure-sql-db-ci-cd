CREATE TABLE [data].[ACCT_RevenueSharing_PassengerTypeDistribution] (
    [AdultCount]        TINYINT        NOT NULL,
    [ChildCount]        TINYINT        NOT NULL,
    [PassengerTypeCode] NVARCHAR (20)  NOT NULL,
    [ValidFromDate]     DATE           NOT NULL,
    [ValidToDate]       DATE           NULL,
    [Distribution]      NUMERIC (9, 8) NOT NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_PassengerTypeDistribution] PRIMARY KEY CLUSTERED ([AdultCount] ASC, [ChildCount] ASC, [PassengerTypeCode] ASC, [ValidFromDate] ASC)
);


GO

