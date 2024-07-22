CREATE PROCEDURE [stg].[DW_OperationMonitoring_TriggerRun_Dedup]
AS
BEGIN

	DELETE S
	FROM
    (
        SELECT *
			, RN = ROW_NUMBER() OVER (PARTITION BY [correlationId] ORDER BY [status])
        FROM stg.DW_OperationMonitoring_TriggerRun
    ) AS S
	WHERE RN > 1

END

GO

