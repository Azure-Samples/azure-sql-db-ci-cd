


CREATE VIEW [dim].[APC_CountingReport_Period] AS


SELECT DISTINCT
    cr.[Period]
   ,d.[Year]
   ,[YearMonth] = d.[YearQuarter]
FROM
    [dim].[Date] d
    JOIN [fact].[APC_CountingReport] cr ON
        cr.[Period] = d.[YearQuarterNo]
UNION
SELECT DISTINCT
    cr.[Period]
   ,d.[Year]
   ,d.[YearMonth]
FROM
    [dim].[Date] d
    JOIN [fact].[APC_CountingReport] cr ON
        cr.[Period] = d.[YearMonthNo]

;

GO

