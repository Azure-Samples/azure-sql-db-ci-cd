create view [dim].[Line_Nyt_Bynet]
as
select
    dim.Line.LineKey
   ,dim.Line.RateAreaCombinationKey
   ,dim.Line.ProductGroupKey
   ,dim.Line.DefaultTransportModeKey
   ,dim.Line.ValidFromDateKey
   ,dim.Line.ValidToDateKey
   ,dim.Line.IsCurrent
   ,dim.Line.SourceSystemCode
   ,dim.Line.SourceSystemEntryId
   ,dim.Line.RateAreaCombinationCode
   ,dim.Line.RateAreaCombinationDisplayIndex
   ,dim.Line.RateAreaCombinationDisplayName
   ,dim.Line.ProductGroupCode
   ,dim.Line.ProductGroupName
   ,dim.Line.ProductGroupDisplayIndex
   ,dim.Line.ProductGroupDisplayName
   ,dim.Line.DefaultTransportModeCode
   ,dim.Line.DefaultTransportModeName
   ,dim.Line.DefaultTransportModeDisplayIndex
   ,dim.Line.DefaultTransportModeDisplayName
   ,dim.Line.LineGid
   ,dim.Line.LineNumber
   ,dim.Line.LineDesignation
   ,dim.Line.LineName
   ,dim.Line.LineDisplayIndex
   ,dim.Line.LineDisplayName
   ,dim.Line.LineIsMonitored
   ,dim.Line.ValidFromDate
   ,dim.Line.ValidToDate
   ,dim.Line.LastModifiedUtcDateTime
   ,data.RT_LinesOfInterest.FocusGroupCode
from
    data.RT_LinesOfInterest
    inner join dim.Line on
        data.RT_LinesOfInterest.LineNumber = dim.Line.LineNumber
where
    (data.RT_LinesOfInterest.FocusGroupCode = 'NYT_BYNET')
    and ValidToDateKey = '99991231'

;

GO

