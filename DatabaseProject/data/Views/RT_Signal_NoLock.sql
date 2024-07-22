

create view [data].[RT_Signal_NoLock]
as
select
    [SignalId]
   ,[Name]
   ,[Location]
   ,[Center]
   	,Long=[Center].[Long]
	,Lat=[Center].[Lat]
from
    [data].[RT_Signal] (nolock)
;

GO

