-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-11-01
-- Description: Update state and statsitics for files based on the currently staged data in stg.APC_ATS_CountingReport.
-- =============================================
create procedure [integration].[APC_ATS_FileState_UpdateFromStg]
(
    -- Add the parameters for the stored procedure here
    @date date
)
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    -- Insert statements for procedure here
    with
    [Stats] as
    (
        select
            [FileRef]
           ,[FromUtcTime] = min([DateTime])
           ,[ToUtcTime] = max([DateTime])
        from
            [stg].[APC_ATS_CountingReport]
        group by
            [FileRef]
    )
    update
        s
    set
        [State] = 0
       ,[FromUtcTime] = d.[FromUtcTime]
       ,[ToUtcTime] = d.[ToUtcTime]
       ,[UpdatedUtc] = sysdatetime()
    from
        [integration].[APC_ATS_FileState] s
        join [Stats] d on
            d.[FileRef] = s.[FileRef];
end;

GO

