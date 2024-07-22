


create view [dim].[RT_Enumeration_ArrivalType]
as
select        EnumerationKey, ValidFromDateKey, ValidToDateKey, IsCurrent, SourceSystemCode, SourceSystemEntryId, EnumerationType, EnumerationTypeName, EnumerationTypeDisplayName, EnumerationTypeDisplayIndex, 
                         EnumerationStateName, EnumerationStateDisplayName, EnumerationStateDisplayIndex, EnumerationStateDescription, RDACode, EnumerationStateNumber, ValidFromDate, ValidToDate
FROM            dim.RT_Enumeration
WHERE        (EnumerationType = 2)

GO

