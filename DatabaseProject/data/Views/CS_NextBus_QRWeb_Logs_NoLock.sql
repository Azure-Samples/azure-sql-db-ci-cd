
create view [data].[CS_NextBus_QRWeb_Logs_NoLock]
as
select
    [SourceSystemCode]
   ,[SourceSystemEntryRef]
   ,[URL]
   ,[StopNr]
   ,[WeekNr]
   ,[TimeGeneratedUTC]
   ,[TimestampUTC]
   ,[TimestampMS]
   ,[Success]
   ,[ResultCode]
   ,[DurationMs]
   ,[Inserted]
   ,[Updated]
from
    [data].[CS_NextBus_QRWeb_Logs] with (nolock);

GO

