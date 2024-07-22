CREATE view dim.Time_NoLock as (select
    [TimeKey]
   ,[Time]=cast(Time as varchar(8))
   ,[Hour]
   ,[TimeBandName]=cast(TimeBandName as varchar(32))
   ,[TimeBandBounds]=cast(TimeBandBounds as varchar(16))
   ,[TimeBandDisplayName]=cast(TimeBandDisplayName as varchar(64))
   ,[TimeBandDisplayIndex]
from
  [dim].[Time] with (nolock))

GO

