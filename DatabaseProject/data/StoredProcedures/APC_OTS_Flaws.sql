




-- =============================================
-- Author:      Anne Hjorth Nielsen
-- Create Date: 2023-01-10
-- Description: OutPut: Flaws from Balance Accuracy (< 95%) and Data Coverage (< 96%) from previous month converted into json column.
-- =============================================

CREATE procedure [data].[APC_OTS_Flaws]
as
begin
    -- SET NOCOUNT ON added to prevent extra result sets from
    set nocount on;

   with
        [OTSType1] as
            (
                select
                    cast(left(YearMonthNo, 4) + '-' + right(YearMonthNo, 2) + '-01' as date) DATO
                   ,VehicleRef BUS
                   ,ContractName
                   ,BalanceAccuracy KOMMENTAR
                   ,1 OTSTYPE
                from
                    data.APC_OTS_BalanceAccuracy
                where
                    YearMonthNo = format(dateadd(month, -1, getdate()), 'yyyyMM') --should be -1
                    and BalanceAccuracy < 0.95
            )
   ,
        [OTSType2] as
            (
                select
                    cast(left(YearMonthNo, 4) + '-' + right(YearMonthNo, 2) + '-01' as date) DATO
                   ,VehicleRef BUS
                   ,ContractName
                   ,DataCoverage KOMMENTAR
                   ,2 OTSTYPE
                from
                    data.APC_OTS_DataCoverage
                where
                    YearMonthNo = format(dateadd(month, -1, getdate()), 'yyyyMM') --should be -1
                    and DataCoverage < 0.96
                    and not VehicleRef in -- If there is a flaw of both OTS type 1 and OTS type 2, then only select the flaw from OTS type 1. A Vehicle can not recieve penalty for 2 flaws in the same month.
                            (
                                select
                                    BUS
                                from
                                    OTSType1
                            )
            )
    select (
               select
                   *
               from (
                   select
                       *
                   from
                       [OTSType1]
                   union
                   select
                       *
                   from
                       [OTSType2]
               ) as Flaws
               for json auto, include_null_values
           ) as Result;
end;

GO

