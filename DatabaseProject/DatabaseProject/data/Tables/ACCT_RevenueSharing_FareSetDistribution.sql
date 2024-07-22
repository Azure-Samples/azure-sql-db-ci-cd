CREATE TABLE [data].[ACCT_RevenueSharing_FareSetDistribution] (
    [OriginZoneRef] NVARCHAR (20)  NOT NULL,
    [ZoneCount]     TINYINT        NOT NULL,
    [FareSetCode]   NVARCHAR (20)  NOT NULL,
    [ValidFromDate] DATE           NOT NULL,
    [ValidToDate]   DATE           NULL,
    [Distribution]  NUMERIC (9, 8) NOT NULL,
    [PersonCount]   INT            NULL,
    CONSTRAINT [PK_ACCT_RevenueSharing_FareSetDistribution] PRIMARY KEY CLUSTERED ([OriginZoneRef] ASC, [ZoneCount] ASC, [FareSetCode] ASC, [ValidFromDate] ASC)
);


GO

