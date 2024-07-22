


-- =============================================
-- Author:      Ran Wang
-- Create Date: 2022-01-31
-- Description: Generate state of JourneyCorrection_VehiclePosition
-- =============================================
create procedure [integration].[EXPORT_JourneyCorrection_VehiclePosition_ExportState_GenerateState]
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    set nocount on;

    declare
        @base datetime2 = '2019-01-01'
       ,@fromDateTimeUtc datetime2
       ,@toDateTimeUtc datetime2;

    select
        @fromDateTimeUtc = max([ToDateTimeUtc])
    from
        [integration].[EXPORT_JourneyCorrection_VehiclePosition_ExportState];

    if @fromDateTimeUtc is null
        select
            @fromDateTimeUtc
            = max((cast([Date] as datetime2(0))at time zone 'Central European Standard Time') at time zone 'UTC')
        from
            [integration].[RPS_Matching_ProcessState]
        where
            [LastProcessedTimestamp] is not null;

    select
        @toDateTimeUtc
        = max((cast(dateadd(day, 1, [Date]) as datetime2(0))at time zone 'Central European Standard Time') at time zone 'UTC')
    from
        [integration].[RPS_Matching_ProcessState]
    where
        [LastProcessedTimestamp] is not null;
    declare @b int = datediff(hour, @base, @fromDateTimeUtc);
    declare @n int = @b + datediff(hour, @fromDateTimeUtc, @toDateTimeUtc) - 1;

    with
    n as (select n = @b where @b < @n union all select n + 1 from n where n < @n)
   ,
    [Source] as
    (
        select
            [FileNumber] = n + 1
           ,[FromDateTimeUtc] = dateadd(hour, n, @base)
           ,[ToDateTimeUtc] = dateadd(hour, n + 1, @base)
           ,[State] = 1
        from
            n
    )
    insert into
        [integration].[EXPORT_JourneyCorrection_VehiclePosition_ExportState] ([FileNumber], [FromDateTimeUtc], [ToDateTimeUtc], [State])
    select
        [FileNumber]
       ,[FromDateTimeUtc]
       ,[ToDateTimeUtc]
       ,[State]
    from
        [Source] s
    where
        not exists (
        select
            1
        from
            [integration].[EXPORT_JourneyCorrection_VehiclePosition_ExportState] t
        where
            t.[FileNumber] = s.[FileNumber]
    )
    option (maxrecursion 0);

end;

GO

