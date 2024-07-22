create view [dim].[RT_Contractor_Current]
as(
select distinct
    isnull(ContractorCode, '') as ContractorCode
   ,ContractorName
   ,ContractorNumber
from
    [dim].[Contractor]
where
    IsCurrent = 1)
;

GO

