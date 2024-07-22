


create view [data].[ACCT_Erp_Transaction_NoLock]
as(
select
    SourceSystemCode
   ,SourceSystemEntryRef
   ,AccountNumber
   ,Date
   ,Voucher
   ,Text
   ,Amount
   ,Type
   ,SourceSystemGlobalDimension1Ref
   ,SourceSystemGlobalDimension2Ref
   ,OrganizationCode
   --,PurposeCode
   ,SourceSystemGlobalDimension3Ref
   --,SpecificationCode
   ,VatAmount
   ,VatGroupCode
   ,CompanyCode
   --,CustomerCode
   ,SourceSystemGlobalDimension4Ref
   ,SourceSystemGlobalDimension5Ref
   ,SourceSystemGlobalDimension6Ref
from
    data.ACCT_Erp_Transaction with (nolock));

GO

