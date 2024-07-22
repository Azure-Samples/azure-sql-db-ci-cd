
-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-12-10
-- Description: Inserts / Updates [data].[APC_ATS_DailyVehicleLocationQuality] based on PositionReports timestamped on a date between @fromUtcDate and @toUtcDate
-- =============================================
create procedure [data].[APC_ATS_DailyVehicleLocationQuality_UpsertFromPositionReport] (@fromUtcDate date, @toUtcDate date)
as
begin

    truncate table [stg].[APC_ATS_DailyVehicleLocationQuality];

    insert into [stg].[APC_ATS_DailyVehicleLocationQuality] (
        [Date]
       ,[VehicleRef]
       ,[PositionCount]
       ,[MessageAccuracy]
       ,[HdopAccuracy]
       ,[SpeedAccuracy]
    )
    select
        [Date] = cast(DateTime as date)
       ,[VehicleRef]
       ,PositionCount = count([Latitude] + [Longitude])
       ,[MessageAccuracy] = 1 - avg((abs((nullif(LagTime, 0) - 1000.0) / (nullif(LagTime, 0) + 1000.0))))
       ,[HdopAccuracy] = avg(case when GpsHdop <= 2 then 1.0 when GpsHdop > 2 then 0.0 else null end)
       ,[SpeedAccuracy] = avg(case
                                  when ((nullif([LagDistance], 0) / (nullif([LagTime], 0) / 1000.0)) * 3.6) <= 130 then 1.0
                                  when ((nullif([LagDistance], 0) / (nullif([LagTime], 0) / 1000.0)) * 3.6) > 130 then 0.0
                                  else null
                              end
                          )
    from
        [data].[APC_ATS_PositionReport]
    where
        @fromUtcDate <= [DateTime]
        and [DateTime] < dateadd(day, 1, @toUtcDate)
    group by
        cast(DateTime as date)
       ,[VehicleRef];

    exec [integration].[AutoMerge]
        @Source = '[stg].[APC_ATS_DailyVehicleLocationQuality]'
       ,@Target = '[data].[APC_ATS_DailyVehicleLocationQuality]'
       ,@Mode = 1
       ,@TruncateSourceAfterMerge = 1;

end;

GO

