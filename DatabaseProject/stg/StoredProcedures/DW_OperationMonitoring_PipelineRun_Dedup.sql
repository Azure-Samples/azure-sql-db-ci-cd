CREATE PROCEDURE [stg].[DW_OperationMonitoring_PipelineRun_Dedup]
AS
BEGIN

	DELETE S
	FROM
    (
        SELECT *
			, RN = ROW_NUMBER() OVER (PARTITION BY [pipelineRunId], [status] ORDER BY [status])
        FROM stg.DW_OperationMonitoring_PipelineRun
    ) AS S
	WHERE RN > 1

END

GO

