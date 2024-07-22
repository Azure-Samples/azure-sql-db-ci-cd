



create view [data].[ACCT_Erp_TransactionDetail_NoLock]
as(
select
    *
from
    data.ACCT_Erp_TransactionDetail with (nolock));

GO

