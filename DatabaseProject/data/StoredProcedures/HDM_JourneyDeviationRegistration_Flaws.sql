














-- =============================================
-- Author:      Anne Hjorth Nielsen
-- Create Date: 2023-10-17
-- Description: OutPut: Flaws from HDM_JourneyDeviationRegistration from previous month converted into json column.
-- =============================================

CREATE procedure [data].[HDM_JourneyDeviationRegistration_Flaws]
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    set nocount on;



with
[ToLate] as
(
    select
        [UDBUDSENHED] = trim('A' from c.ContractCode)
       ,[TURDATO] = cast(cast(JourneyDateKey as char(8)) as date)
       ,[LINJE]=l.LineNumber
       ,[TURNUMMER]=jdr.JourneyNumber
       ,[JOURNEYDEVIATIONID] = jdr.SourceSystemEntryRef
       ,[STOPPESTEDFRA]=jdr.FromSequenceNumber
       ,[STOPPESTEDTIL]=jdr.UptoSequenceNumber
       ,[RSAGSKODE] =ar.DeviationReasonStandardCategoryCode
       ,[INDMELDT]=  jdr.ReportedDateTime
       ,[ANTALMINUTTER]=(jdr.DiffInSeconds)/60
       ,[INDMELDER]=jdr.ReportedByInitials
    from
        fact.RT_HDM_JourneyDeviationRegistration jdr
        join dim.Line l on
            l.LineKey = jdr.LineKey
        join dim.contract c on
            c.ContractKey = jdr.ContractKey
        join dim.Contractor con on
            con.ContractorKey = c.ContractorKey
        join dim.RT_HDM_AccountingRule ar on
            ar.AccountingRuleKey = jdr.AccountingRuleKey
    where
        cast(cast(JourneyDateKey as char(8)) as date) between dateadd(month, datediff(month, 0, getdate()) - 1, 0) --First day of previous month
                                                      and     dateadd(month, datediff(month, -1, getdate()) - 1, -1) --Last Day of previous month

        and IsTooLate = '1'
		and c.TenderCode not like 'H%'
		and c.TenderCode not in ('EX')
		and c.ContractName not in ('Ukendt kontrakt')
)
select (select * from ToLate for json auto, include_null_values) as Result;

end;

GO

