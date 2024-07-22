
CREATE VIEW [dim].[StopPoint_NoLock] AS
(
SELECT 
    *
FROM [dim].[StopPoint] WITH (NOLOCK)
)

GO

