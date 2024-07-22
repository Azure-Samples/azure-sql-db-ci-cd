-- =============================================
-- Author:      Niklas Christoffer Petersen
-- Create Date: 2021-12-10
-- Description: Inserts / Updates [data].[APC_ATS_DailyVehicleBalanc] based on CountingReport timestamped on a date between @fromUtcDate and @toUtcDate
-- =============================================
create procedure [data].[APC_ATS_DailyVehicleBalance_UpsertFromCountingReport] (@fromUtcDate date, @toUtcDate date)
as
begin

    truncate table [stg].[APC_ATS_DailyVehicleBalance];

    insert into
        [stg].[APC_ATS_DailyVehicleBalance]
    (
        [Date]
       ,[VehicleRef]
       ,[DailyVehicleBoardingCount]
       ,[DailyVehicleAlightingCount]
       ,[DailyVehicleBalance]
    )
    select
        [Date] = cast([DateTime] as date)
       ,[VehicleRef]
       ,[DailyVehicleBoardingCount] = sum([BoardingCount])
       ,[DailyVehicleAlightingCount] = sum([AlightingCount])
       ,[DailyVehicleBalance] = iif(sum([BoardingCount]) + sum([AlightingCount]) > 0
                                   ,1 - abs(1.0 * (sum([BoardingCount]) - sum([AlightingCount])))
                                    / (sum([BoardingCount]) + sum([AlightingCount]))
                                   ,null)
    from
        [data].[APC_ATS_CountingReport]
    where
        [MatchedLocationContractorRef] is null
        and @fromUtcDate <= [DateTime] and [DateTime] < dateadd(day, 1, @toUtcDate)
    group by
        cast([DateTime] as date)
       ,[VehicleRef];

    exec [integration].[AutoMerge]
        @Source = '[stg].[APC_ATS_DailyVehicleBalance]'
       ,@Target = '[data].[APC_ATS_DailyVehicleBalance]'
       ,@Mode = 1
       ,@TruncateSourceAfterMerge = 1;

end;

GO

