




-- =============================================
-- Author:      Ran Wang
-- Create Date: 2022-01-31
-- Description: Generate state of JourneyCorrection_JourneyPoint
-- =============================================
create procedure [integration].[EXPORT_JourneyCorrection_JourneyPoint_ExportState_GenerateState]

as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare
        @fromDate datetime2
       ,@toDate datetime2;
    ;

    declare @base date = '2019-01-01';

    select
        @fromDate = isnull(max([OperatingDayDate]), cast(getdate() - 1 as datetime2(0)))
    from
        [integration].[EXPORT_JourneyCorrection_JourneyPoint_ExportState];
    select
        @toDate = isnull(max([OperatingDayDate]), @fromDate)
    from
        [data].[RT_Journey]
    where
        [OperatingDayDate] < cast(getdate() as datetime2(0));
    declare @b int = datediff(day, @base, @fromDate);
    declare @n int = @b + datediff(day, @fromDate, @toDate);

    with
    n as (select n = @b union all select n + 1 from n where n < @n)
   ,
    [Source] as
    (
        select
            [FileNumber] = n + 1
           ,[OperatingDayDate] = dateadd(day, n, @base)
           ,[State] = 1
        from
            n
    )
    insert into
        [integration].[EXPORT_JourneyCorrection_JourneyPoint_ExportState] ([FileNumber], [OperatingDayDate], [State])
    select
        [FileNumber]
       ,[OperatingDayDate]
       ,[State]
    from
        [Source] s
    where
        not exists (
        select
            1
        from
            [integration].[EXPORT_JourneyCorrection_JourneyPoint_ExportState] t
        where
            t.[FileNumber] = s.[FileNumber]
    )
    option (maxrecursion 0);

end;

GO

