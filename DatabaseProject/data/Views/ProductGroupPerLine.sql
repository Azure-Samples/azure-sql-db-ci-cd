
create view [data].[ProductGroupPerLine]
as(
select
    [SourceSystemCode]
   ,[SourceSystemEntryId] = [SourceSystemEntryRef]
   ,[LineSourceSystemEntryId] = [LineSourceSystemEntryRef]
   ,[ProductGroupCode]
   ,[ValidFromDate]
   ,[ValidToDate]
from
    [data].[RT_LineProductGroup]);

GO

