create   view [fact].[QA_ServiceQualitySurvey_ServiceLevel_NoLock]
as
with
cte_ContractKey (ContractKey) as (
select distinct ContractKey from fact.QA_ServiceQualitySurvey
                                 )
,
cte_ContractorKey (ContractorKey) as (select distinct ContractorKey from fact.QA_ServiceQualitySurvey)
select
    pd.DateKey
   ,pd.ContractorKey
   ,pd.ContractKey
   ,pd.LineKey
   ,pd.PaidDurationSeconds
   ,pd.CancelledDurationSeconds
   ,pd.PricePerHour
   ,pd.OfferedServiceLevel
   ,pd.JourneyRef
   ,d.MeasuringPeriod
from
    fact.QA_ServiceQualitySurvey_ServiceLevel as pd
    inner join cte_ContractKey as ck on
        ck.ContractKey = pd.ContractKey
    inner join cte_ContractorKey as crk on
        crk.ContractorKey = pd.ContractorKey
    left join dim.Contract as c on
        c.ContractKey = pd.ContractKey
    join integration.QA_ServiceQualitySurvey_MeasuringPeriodContractBridge as mpcb on
        mpcb.ContractCode = c.ContractCode
    join dim.QA_ServiceQualitySurvey_MeasuringPeriod as d on
        d.SourceSystemEntryId = mpcb.MeasuringPeriodSourceSystemEntryId
        and pd.DateKey between d.ValidFromDateKey and d.ValidToDateKey
where
    pd.DateKey >= 20190101; --start from 1 jan 2019

GO

