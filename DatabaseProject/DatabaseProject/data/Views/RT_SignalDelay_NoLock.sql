


create view [data].[RT_SignalDelay_NoLock] as
select [SignalId]
      ,[JourneyRef]
      ,[LineNumber]
      ,[EnterDateTimeUtc]
      ,[CenterDateTimeUtc]
      ,[IntersectionTraversalSec]
      ,[PreviousStopPointDelaySec]
      ,[IsStopInCircle]
      ,[Hash]
      ,[Inserted]
      ,[Updated]
      ,[LineDesignation]
      ,[LineDirectionName]
      ,[EnterDate]
      ,[EnterTime]
      ,[EnterMonth]
      ,[EnterYear]
      ,[EnterQuarter]
      ,[EnterDay]
      ,[EnterTimeBandName]
      ,[EnterTimeBandBounds]
      ,[EnterTimeBandAltName]
      ,[EnterTimeBandAltBounds]
      ,[CenterDate]
      ,[CenterTime]
from [data].[RT_SignalDelay] (nolock)

GO

