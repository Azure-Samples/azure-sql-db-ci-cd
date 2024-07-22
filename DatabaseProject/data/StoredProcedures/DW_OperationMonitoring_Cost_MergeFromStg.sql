CREATE PROCEDURE [data].[DW_OperationMonitoring_Cost_MergeFromStg]
AS
BEGIN

	WITH Stg AS (
		SELECT DISTINCT [Date], [Environment]
		FROM [stg].[DW_OperationMonitoring_Cost]
	)
	DELETE ToDelete
	FROM [data].[DW_OperationMonitoring_Cost] ToDelete
	JOIN Stg
	ON ToDelete.[Date] = Stg.[Date] AND ToDelete.[Environment] = Stg.[Environment]

	INSERT INTO [data].[DW_OperationMonitoring_Cost]
	SELECT * FROM [stg].[DW_OperationMonitoring_Cost]

END

GO

