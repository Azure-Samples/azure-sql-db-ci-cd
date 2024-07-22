CREATE TABLE [stg].[ACCT_RevenueSharing_FareSetDistribution] (
    [OriginZoneRef] NVARCHAR (20)  NULL,
    [ZoneCount]     TINYINT        NULL,
    [FareSetCode]   NVARCHAR (20)  NULL,
    [ValidFromDate] DATE           NULL,
    [ValidToDate]   DATE           NULL,
    [Distribution]  NUMERIC (9, 8) NULL,
    [PersonCount]   NVARCHAR (20)  NULL
);


GO

