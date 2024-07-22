create view dim.JourneyPatternSection_NoLock as (select
    [JourneyPatternSectionKey]
   ,[TimingPointSectionDisplayName]=cast([TimingPointSectionDisplayName] as varchar(250))
   ,[TimingPointSectionDisplayIndex]
   ,[TimingPointSectionAbbreviation]=cast([TimingPointSectionAbbreviation] as varchar(250))
   ,[StopPointSectionFromNumber]
   ,[StopPointSectionToNumber]
   ,[TimingPointSectionFromAbbreviation]=cast([TimingPointSectionFromAbbreviation] as varchar(250))
   ,JourneyPatternId
   ,[SequenceNumber] 
from
    [dim].[JourneyPatternSection] with (nolock))

GO

