
create     view [data].[ACCT_DotWebshop_SalesOrder]
as
select
    [Webshop Order No_] = right('00000000000000000000' + right(po.OrderNumber, len(po.OrderNumber) - 3), 20)
   ,po.CreatedDate
   ,po.CompletedDate
   ,po.ModifiedOn
   ,[Line No_] = cast(row_number() over (partition by
                                             po.OrderId
                                         order by
                                             ol.OrderLineId asc
                                   ) * 10000 as int)
   ,ol.CreatedOn
   ,po.OrderId
   ,ol.OrderLineId
   ,olp.CompanyInfoAsJson
   ,olp.IsPrintselv
   ,olp.JourneyAsJson
   ,olp.NavKey
   ,olp.NavNo
   ,olp.NavUpdateDate
   ,olp.OriginZone
   ,olp.PeriodAsJson
   ,olp.PersonalInfoAsJson
   ,olp.StamkortsNummerAsJson
   ,olp.Text1
   ,olp.Text2
   ,olp.Text3
   ,olp.Text4
   ,olp.ZoneAsJson
   ,Name = case
               when oa.LastName = '<FirstNameIsUsedAsFullName>'
                   then oa.FirstName
               else oa.FirstName + ' ' + oa.LastName
           end
   ,oa.Line1
   ,Line2 = case
                when oa.Line2 is null
                    then ''
                else oa.Line2
            end
   ,oa.PostalCode
   ,oa.City
   ,oa.EmailAddress
   ,Phonenumber = case
                      when (
                          oa.MobilePhoneNumber is not null
                          and oa.MobilePhoneNumber != ''
                      )
                          then oa.MobilePhoneNumber
                      when (
                          oa.PhoneNumber is not null
                          and oa.PhoneNumber != ''
                      )
                          then oa.PhoneNumber
                      else ''
                  end
from
    data.ACCT_DotWebshop_PurchaseOrder as po (nolock)
    inner join data.ACCT_DotWebshop_OrderLine as ol (nolock) on
        po.OrderId = ol.OrderId
    left join (
        select
            pvt.OrderId
           ,pvt.OrderLineId
           ,CompanyInfoAsJson
           ,IsPrintselv
           ,JourneyAsJson = nullif(JourneyAsJson, 'anonym') -- The nullif function was introduced due to data quality during Taiga #1833.
           ,NavKey
           ,NavNo
           ,NavUpdateDate
           ,OriginZone
           ,PeriodAsJson = nullif(PeriodAsJson, 'anonym') -- The nullif function was introduced due to data quality during Taiga #1833.
           ,PersonalInfoAsJson
           ,StamkortsNummerAsJson
           ,Text1
           ,Text2
           ,Text3
           ,Text4
           ,ZoneAsJson = nullif(ZoneAsJson, 'anonym') -- The nullif function was introduced due to data quality during Taiga #1833.
        from (
            select
                OrderId
               ,OrderLineId
               ,[Key]
               ,Value
            from
                data.ACCT_DotWebshop_OrderProperty (nolock)
            where
                OrderLineId is not null
        ) as x
        pivot (
            max(Value)
            for [Key] in
            (
                CompanyInfoAsJson
               ,IsPrintselv
               ,JourneyAsJson
               ,NavKey
               ,NavNo
               ,NavUpdateDate
               ,OriginZone
               ,PeriodAsJson
               ,PersonalInfoAsJson
               ,StamkortsNummerAsJson
               ,Text1
               ,Text2
               ,Text3
               ,Text4
               ,ZoneAsJson
            )
        ) as pvt
    ) as olp on
        po.OrderId = olp.OrderId
        and ol.OrderLineId = olp.OrderLineId
    left join data.ACCT_DotWebshop_OrderAddress as oa (nolock) on
        po.BillingAddressId = oa.OrderAddressId
;

GO

