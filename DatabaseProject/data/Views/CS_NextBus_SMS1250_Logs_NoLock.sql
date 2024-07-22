
create view [data].[CS_NextBus_SMS1250_Logs_NoLock]
as
select
    [SourceSystemCode]
   ,[SourceSystemEntryRef]
   ,[FileNameFtp]
   ,[TimeGenerated]
   ,[Log]
   ,[StopNr]
   ,[StopName]
   ,[ExactStopNrMatch]
   ,[IsCountable]
   ,[Inserted]
   ,[Updated]
from
    [data].[CS_NextBus_SMS1250_Logs] with (nolock);

GO

