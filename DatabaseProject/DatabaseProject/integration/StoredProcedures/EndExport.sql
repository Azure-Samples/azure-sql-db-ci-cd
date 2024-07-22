




-- =============================================
-- Author:		Niklas Christoffer Petersen
-- Create date: 2014-02-28
-- Description:	Stored Procedure Implementation of Cycle System.
-- =============================================
CREATE PROCEDURE [integration].[EndExport]
	@TargetSystemCode nvarchar(20),
	@EntityName nvarchar(100),
    @Mode int = 1,

	@DateTimeMark datetime = NULL--,
	--@VersionMark bigint = NULL,
	--@LsnMark numeric(25,0) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE
        [integration].[ExportControl]
    SET
        [State] = 0,
        [DateTimeMark] = ISNULL(@DateTimeMark, [DateTimeMark])--,
        --[CdcVersionMark] = ISNULL(@VersionMark, [CdcVersionMark]),
        --[CdcLsnMark] = ISNULL(@LsnMark, [CdcLsnMark])
    WHERE
        [TargetSystemCode] = @TargetSystemCode AND
        [EntityName] = @EntityName AND
        [State] = @Mode;
END

GO

