CREATE PROCEDURE [stg].[DW_OperationMonitoring_ActivityRun_Dedup]
AS
BEGIN

	DELETE S
	FROM
    (
        SELECT *
			, RN = ROW_NUMBER() OVER (PARTITION BY [activityRunId], [status] ORDER BY [status])
        FROM stg.DW_OperationMonitoring_ActivityRun
    ) AS S
	WHERE RN > 1

END

GO

