
CREATE view [dim].[RT_IsLastStopPoint]

as

SELECT	1 as IsLastStopPoint
UNION
SELECT	0 as IsLastStopPoint

GO

