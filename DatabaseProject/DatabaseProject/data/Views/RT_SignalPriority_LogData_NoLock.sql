


CREATE view [data].[RT_SignalPriority_LogData_NoLock]
as(
select
    *
from
    [data].[RT_SignalPriority_LogData] (nolock)
    )
;

GO

