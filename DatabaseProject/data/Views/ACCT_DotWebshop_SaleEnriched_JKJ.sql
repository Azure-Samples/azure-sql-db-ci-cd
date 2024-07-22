CREATE view [data].[ACCT_DotWebshop_SaleEnriched_JKJ]
as
with
CTE_ACCT_Erp_SalesInvoice as
(
    select
        [Document No_] = t.Voucher
       ,[Web Order No_] = d.WebshopOrderNo
       ,[Posting Date] = d.PostingDate
       ,[Sell-to Customer No_] = d.CustomerCode
       ,[Bill-to Customer No_] = 'Undersøg behov'                             -- = t.CustomerCode = null
       ,[Line No_] = d.WebShopOrderLineNo                                      -- Kontrolleres
       ,Type                                                                   -- Kontrolleres
       ,No_ = d.ItemNo
       ,[Location Code] = 'Undersøg behov'                                    --= d.LocationCode = null
       ,[Shipment Date] = 'Undersøg behov'                                    --'kan være forskellig fra Date og /eller PostingDate?'
       ,d.Description
       ,[Unit of Measure] = 'Undersøg behov, men er tilsyneladen altid "STK"' -- 'STK'
       ,d.Quantity                                                             -- har omvendt fortegn
       ,d.Amount                                                               -- har omvendt fortegn
       ,[Shortcut Dimension 1 Code] = t.SourceSystemGlobalDimension1Ref
       ,[Shortcut Dimension 2 Code] = t.SourceSystemGlobalDimension2Ref
       ,[Customer Price Group] = 'Undersøg behov'
       ,[Gen_ Prod_ Posting Group] = d.ProductPostingGroup
       ,[Sales Account] = t.AccountNumber
       ,[Order No_] = 'Undersøg behov'
       ,Faktureringsmetode = [Text]                                            --,[Order No_] = iif(calc.TextDerivative = 'faktura', 'undersøg behov', null)
    --,Faktureringsmetode = case
    --                          when calc.TextDerivative = 'ordre' then 'Faktura fra salgsordre'
    --                          when calc.TextDerivative = 'faktura' then 'Samle faktura'
    --                          else 'Ukendt'
    --                      end
    from
        data.ACCT_Erp_TransactionDetail as d (nolock)
        left join data.ACCT_Erp_Transaction as t (nolock) on
            t.SourceSystemEntryRef = d.SourceSystemTransactionRef
    --  cross apply (select TextDerivative = left(text, charindex(' ', text, 1) - 1)) as calc
    where
        LocationCode = 'web'
-- WebshopOrderNo is not null;
)
,
CTE_ACCT_DotWebshop_SalesOrder as
(
    select
        [Webshop Order No_] = right('00000000000000000000' + right(po.OrderNumber, len(po.OrderNumber) - 3), 20)
       ,po.CreatedDate
       ,po.CompletedDate
       ,po.ModifiedOn
       ,[Line No_] = cast(row_number() over (partition by po.OrderId order by ol.OrderLineId asc) * 10000 as int)
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
                   when oa.LastName = '<FirstNameIsUsedAsFullName>' then oa.FirstName
                   else oa.FirstName + ' ' + oa.LastName
               end
       ,oa.Line1
       ,Line2 = case when oa.Line2 is null then '' else oa.Line2 end
       ,oa.PostalCode
       ,oa.City
       ,oa.EmailAddress
       ,Phonenumber = case
                          when (oa.MobilePhoneNumber is not null and oa.MobilePhoneNumber != '') then
                              oa.MobilePhoneNumber
                          when (oa.PhoneNumber is not null and oa.PhoneNumber != '') then oa.PhoneNumber
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
               ,JourneyAsJson = nullif(JourneyAsJson, 'anonym')        -- The nullif function was introduced due to data quality during Taiga #1833.
               ,NavKey
               ,NavNo
               ,NavUpdateDate
               ,OriginZone
               ,PeriodAsJson
               ,PeriodAsJson_Original = nullif(PeriodAsJson, 'anonym') -- The nullif function was introduced due to data quality during Taiga #1833.
               ,PersonalInfoAsJson
               ,StamkortsNummerAsJson
               ,Text1
               ,Text2
               ,Text3
               ,Text4
               ,ZoneAsJson = nullif(ZoneAsJson, 'anonym')              -- The nullif function was introduced due to data quality during Taiga #1833.
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
                for [Key] in (CompanyInfoAsJson, IsPrintselv, JourneyAsJson, NavKey, NavNo, NavUpdateDate, OriginZone
                             ,PeriodAsJson, PersonalInfoAsJson, StamkortsNummerAsJson, Text1, Text2, Text3, Text4
                             ,ZoneAsJson
                )
            ) as pvt
        ) as olp on
            po.OrderId = olp.OrderId
            and ol.OrderLineId = olp.OrderLineId
        left join data.ACCT_DotWebshop_OrderAddress as oa (nolock) on
            po.BillingAddressId = oa.OrderAddressId
)
,
[CTE_ACCT_DotWebshop_Sale] as
(
    /*
    Dette view joiner [View NAV Web Sales Invoice] og [View DOT Webshop Sales Order] på linjeniveau.
    Informationer i JSON felter bliver fortolket
    */
    select
        si.[Document No_]              -- relation til [Sales Invoice Header].[No_]
       ,si.[Web Order No_]
       ,si.[Posting Date]
       ,si.[Sell-to Customer No_]      -- som på [Sales Invoice Header]
       ,si.[Bill-to Customer No_]      -- som på Sales Invoice Header
       ,si.[Line No_]
       ,si.Type                        -- Option felt. 0 = BLANK, 1 = Finanskonto, 2 = Vare, 3 = Ressource, 4 = Anlæg,Gebyr (vare)
       ,si.No_                         -- Nummeret på typen, ex. Type = 2 (Vare) er det varenummeret
       ,si.[Location Code]
       ,si.[Shipment Date]
       ,si.Description
       ,si.[Unit of Measure]
       ,si.Quantity                    -- Antal i salgsenhed
       ,si.Amount                      -- Beløbet for linjen (Antal i salgsenhed * Stykpris)
       ,si.[Shortcut Dimension 1 Code] -- Dimensionsoplysninger
       ,si.[Shortcut Dimension 2 Code] -- Dimensionsoplysninger
       ,si.[Customer Price Group]
       ,si.[Gen_ Prod_ Posting Group]
       ,si.[Sales Account]
       ,PeriodeStart = case
                           when wo.PeriodAsJson is not null then cast(right(left(wo.PeriodAsJson, 20), 10) as datetime)
                           else cast(null as datetime)
                       end
                                       /*
        Incident S2306-158  (https://movia.topdesk.net/tas/secure/mango/window/0?t=1692083265467).

        Error description:  When using the view "data.ACCT_DotWebshop_SaleEnriched", wich depends on this view ("data.ACCT_DotWebshop_Sale"),
                            conversion error occured due to casting part of string to datetime as string part did not conform to the datetime format.

        Root cause:         For some entries in the interval for column [Posting Date] between '2023-05-12' and '2023-05-13', the format of strings
                            in the column "PeriodAsJson" changed.
                            For example the format changed
                            from    {"Start":"2017-01-25T00:00:00","LogicalEnd":"2017-02-26T00:00:00"}
                            to      {"Start":"2017-01-25T00:00:00+02:00","LogicalEnd":"2017-02-26T00:00:00+02:00"}.

        Solution:           The calculation of the two columns PeriodeSlut and [Antal kort dage] has been changed.
                            Changes has been implemented as below with the changed line referencing to this incident.
    */
       ,PeriodeSlut = case
                          when wo.PeriodAsJson is not null then
                              -- dateadd(ss, -1, cast(left(right(wo.PeriodAsJson, 21), 10) as datetime)) - Incident S2306-158.
                              dateadd(
                                  ss
                                 ,-1
                                 ,cast(substring(PeriodAsJson, charindex(',', PeriodAsJson) + 15, 10) as datetime)
                              )
                          else cast(null as datetime)
                      end
       ,[Antal kort dage] = datediff(
                                dd
                               ,case
                                    when wo.PeriodAsJson is not null --{"Start":"2017-01-25T00:00:00+02:00","LogicalEnd":"2017-02-26T00:00:00+02:00"}
                               then         cast(right(left(wo.PeriodAsJson, 20), 10) as datetime)
                                    else cast(null as datetime)
                                end
                               ,case
                                    when wo.PeriodAsJson is not null --{"Start":"2017-01-25T00:00:00+02:00","LogicalEnd":"2017-02-26T00:00:00+02:00"}
                               then
                                        -- cast(left(right(wo.PeriodAsJson, 21), 10) as datetime) - Incident S2306-158.
                                        cast(substring(PeriodAsJson, charindex(',', PeriodAsJson) + 15, 10) as datetime)
                                    else cast(null as datetime)
                                end
                            )
       ,SelectedZones = case
                            when wo.JourneyAsJson is not null then
                                left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                             - (patindex('%SelectedZones%', wo.JourneyAsJson)
                                                                + len('SelectedZones') + 2
                                                               )), patindex(
                                                                       '%],%'
                                                                      ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                               - (patindex(
                                                                                                                             '%SelectedZones%'
                                                                                                                             ,wo.JourneyAsJson
                                                                                                                             )
                                                                                                                             + len(
                                                                                                                               'SelectedZones'
                                                                                                                               )
                                                                                                                             + 2
                                                                                                 )
                                                                                               - 1)
                                                                   ))
                            when wo.JourneyAsJson is null
                                 and wo.ZoneAsJson is not null then
                                left(right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                          - (patindex('%SelectedZones%', wo.ZoneAsJson)
                                                             + len('SelectedZones') + 2
                                                            )), patindex(
                                                                    '%],%'
                                                                   ,right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                                         - (patindex(
                                                                                                                       '%SelectedZones%'
                                                                                                                       ,wo.ZoneAsJson
                                                                                                                       )
                                                                                                                       + len(
                                                                                                                         'SelectedZones'
                                                                                                                         )
                                                                                                                       + 2
                                                                                           )
                                                                                         - 1)
                                                                ))
                        end
       ,CountSelectedZones = case
                                 when wo.JourneyAsJson is not null then
                                     len(left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                      - (patindex('%SelectedZones%', wo.JourneyAsJson)
                                                                         + len('SelectedZones') + 2
                                                                        )), patindex(
                                                                                '%],%'
                                                                               ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                                        - (patindex(
                                                                                                                                      '%SelectedZones%'
                                                                                                                                      ,wo.JourneyAsJson
                                                                                                                                      )
                                                                                                                                      + len(
                                                                                                                                        'SelectedZones'
                                                                                                                                        )
                                                                                                                                      + 2
                                                                                                          )
                                                                                                        - 1)
                                                                            ))
                                     )
                                     - len(replace(
                                               left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                            - (patindex(
                                                                               '%SelectedZones%', wo.JourneyAsJson
                                                                               ) + len('SelectedZones') + 2
                                                                              )), patindex(
                                                                                      '%],%'
                                                                                     ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                                              - (patindex(
                                                                                                                                              '%SelectedZones%'
                                                                                                                                              ,wo.JourneyAsJson
                                                                                                                                              )
                                                                                                                                              + 15
                                                                                                                )
                                                                                                              - 1)
                                                                                  ))
                                              ,','
                                              ,''
                                           )
                                       ) + 1
                                 when wo.JourneyAsJson is null
                                      and wo.ZoneAsJson is not null then
                                     len(left(right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                   - (patindex('%SelectedZones%', wo.ZoneAsJson)
                                                                      + len('SelectedZones') + 2
                                                                     )), patindex(
                                                                             '%],%'
                                                                            ,right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                                                  - (patindex(
                                                                                                                                '%SelectedZones%'
                                                                                                                                ,wo.ZoneAsJson
                                                                                                                                )
                                                                                                                                + len(
                                                                                                                                  'SelectedZones'
                                                                                                                                  )
                                                                                                                                + 2
                                                                                                    )
                                                                                                  - 1)
                                                                         ))
                                     )
                                     - len(replace(
                                               left(right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                         - (patindex('%SelectedZones%', wo.ZoneAsJson)
                                                                            + len('SelectedZones') + 2
                                                                           )), patindex(
                                                                                   '%],%'
                                                                                  ,right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                                                        - (patindex(
                                                                                                                                      '%SelectedZones%'
                                                                                                                                      ,wo.ZoneAsJson
                                                                                                                                      )
                                                                                                                                      + 15
                                                                                                          )
                                                                                                        - 1)
                                                                               ))
                                              ,','
                                              ,''
                                           )
                                       ) + 1
                             end
       ,CountPaidZones = case
                             when wo.JourneyAsJson is not null then
                                 left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                              - (patindex('%ZoneCountForPrice%', wo.JourneyAsJson)
                                                                 + len('ZoneCountForPrice') + 1
                                                                )), patindex(
                                                                        '%,%'
                                                                       ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                                - (patindex(
                                                                                                       '%ZoneCountForPrice%'
                                                                                                                                      ,wo.JourneyAsJson
                                                                                                   )
                                                                                                   + len('ZoneCountForPrice')
                                                                                                   + 2
                                                                                                  ))
                                                                    ))
                             when wo.JourneyAsJson is null
                                  and wo.ZoneAsJson is not null then
                                 len(left(right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                               - (patindex('%SelectedZones%', wo.ZoneAsJson)
                                                                  + len('SelectedZones') + 2
                                                                 )), patindex(
                                                                         '%],%'
                                                                        ,right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                                              - (patindex(
                                                                                                                            '%SelectedZones%'
                                                                                                                            ,wo.ZoneAsJson
                                                                                                                            )
                                                                                                                            + len(
                                                                                                                              'SelectedZones'
                                                                                                                              )
                                                                                                                            + 2
                                                                                                )
                                                                                              - 1)
                                                                     ))
                                 )
                                 - len(replace(
                                           left(right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                     - (patindex('%SelectedZones%', wo.ZoneAsJson)
                                                                        + len('SelectedZones') + 2
                                                                       )), patindex(
                                                                               '%],%'
                                                                              ,right(wo.ZoneAsJson, len(wo.ZoneAsJson)
                                                                                                    - (patindex(
                                                                                                                                  '%SelectedZones%'
                                                                                                                                  ,wo.ZoneAsJson
                                                                                                                                  )
                                                                                                                                  + 15
                                                                                                      )
                                                                                                    - 1)
                                                                           ))
                                          ,','
                                          ,''
                                       )
                                   ) + 1
                         end
       ,StartZone = case
                        when wo.JourneyAsJson is not null then
                            left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                         - (patindex('%JourneyStartZone%', wo.JourneyAsJson)
                                                            + len('JourneyStartZone') + 1
                                                           )), patindex(
                                                                   '%,%'
                                                                  ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                           - (patindex(
                                                                                                  '%JourneyStartZone%'
                                                                                                                                ,wo.JourneyAsJson
                                                                                              )
                                                                                              + len('JourneyStartZone')
                                                                                              + 2
                                                                                             ))
                                                               ))
                    end
       ,EndZone = case
                      when wo.JourneyAsJson is not null then
                          left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                       - (patindex('%JourneyEndZone%', wo.JourneyAsJson)
                                                          + len('JourneyEndZone') + 1
                                                         )), patindex(
                                                                 '%,%'
                                                                ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                         - (patindex(
                                                                                                                        '%JourneyEndZone%'
                                                                                                                        ,wo.JourneyAsJson
                                                                                                                        )
                                                                                                                        + len(
                                                                                                                          'JourneyEndZone'
                                                                                                                          )
                                                                                                                        + 2
                                                                                           ))
                                                             ))
                  end
       ,StartZoneName = case
                            when wo.JourneyAsJson is not null then
                                left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                             - (patindex('%JourneyStartName%', wo.JourneyAsJson)
                                                                + len('JourneyStartName') + 2
                                                               )), patindex(
                                                                       '%,%'
                                                                      ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                               - (patindex(
                                                                                                      '%JourneyStartName%'
                                                                                                                                    ,wo.JourneyAsJson
                                                                                                  )
                                                                                                  + len('JourneyStartName')
                                                                                                  + 4
                                                                                                 ))
                                                                   ))
                        end
       ,EndZoneName = case
                          when wo.JourneyAsJson is not null then
                              left(right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                           - (patindex('%JourneyEndName%', wo.JourneyAsJson)
                                                              + len('JourneyEndName') + 2
                                                             )), patindex(
                                                                     '%,%'
                                                                    ,right(wo.JourneyAsJson, len(wo.JourneyAsJson)
                                                                                             - (patindex(
                                                                                                                            '%JourneyEndName%'
                                                                                                                            ,wo.JourneyAsJson
                                                                                                                            )
                                                                                                                            + len(
                                                                                                                              'JourneyEndName'
                                                                                                                              )
                                                                                                                            + 4
                                                                                               ))
                                                                 ))
                      end
       ,Passagertype = case when wo.Text2 is null or wo.Text2 = '' then 'V' else wo.Text2 end
       ,Salgsmedie = 'Web'
       ,si.Faktureringsmetode
       ,Navn = wo.Name
       ,[Adresselinje 1] = wo.Line1
       ,[Adresselinje 2] = wo.Line2
       ,Postnummer = wo.PostalCode
       ,[By] = wo.City
       ,[E-mail] = wo.EmailAddress
       ,[Tlf.] = wo.Phonenumber
       ,Stamkortnummer = wo.StamkortsNummerAsJson
    from
        CTE_ACCT_Erp_SalesInvoice as si (nolock)
        left join CTE_ACCT_DotWebshop_SalesOrder as wo (nolock) on
            si.[Web Order No_] = wo.[Webshop Order No_] -- collate Danish_Norwegian_CI_AS
            and si.[Line No_] = wo.[Line No_]
)
,
CTE_ACCT_DotWebshop_SaleEnriched as
(
    /*
    Dette view tilføjer nogle datodimensioner til datasættet [View NAV Web Sales] (dotwebshop), 
    "renser" datasættet for NULL værdier og
    tilføjer Takstsæt.
    */
    select
        [Dokumentnr.] = [Document No_]
       ,[Salgsdato og -tid] = [Posting Date]
       ,Salgsdato = cast(ws.[Posting Date] as date)
       ,Salgsår = dt.Year
       ,Salgsmåned = dt.MonthNo
       ,Salgsmånednavn = dt.Month
       ,[Salgsår og måned] = dt.YearMonthNo
       ,[Salgsår og månednavn] = dt.YearMonth
       ,[Kunde (ordre)] = [Sell-to Customer No_]
       ,[Kunde (Faktura)] = '' -- [Bill-to Customer No_]: Not included in data from NAV/BCOP
                               --     ,[Line No_]
                               --     ,[Type]
       ,[Varenr.] = No_
       ,Lokation = ''          -- [Location Code]: Not included in data from NAV/BCOP
                               --,[Shipment Date]
       ,Beskrivelse = Description
                               --,Enhed = [Unit of Measure]
       ,Antal = cast(-Quantity as int)
       ,Beløb = cast(-Amount as money)
       ,Sted = [Shortcut Dimension 1 Code]
       ,Styring = [Shortcut Dimension 2 Code]
                               --,Kundeprisgruppe = [Customer Price Group]
       ,Bogføringsgruppe = [Gen_ Prod_ Posting Group]
       ,Finanskonto = [Sales Account]
       ,Periode_Fra = case when PeriodeStart is null then '' else PeriodeStart end
       ,Periode_Til = case when PeriodeSlut is null then '' else PeriodeSlut end
       ,[Antal kort dage] = case when [Antal kort dage] is null then '' else [Antal kort dage] end
       ,[Valgte zoner] = case when SelectedZones is null then '' else SelectedZones end
       ,[Antal valgte zoner] = case when CountSelectedZones is null then '' else CountSelectedZones end
       ,[Antal betalte zoner] = case when CountPaidZones is null then '' else CountPaidZones end
       ,Takstsæt = case
                        when SelectedZones is not null then
                            case
                                when cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) < 100
                                     and cast(reverse(
                                                  left(reverse(SelectedZones), patindex('%,%', reverse(SelectedZones))
                                                                               - 1)
                                              ) as int) < 100 then 'TH'
                                when cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) > 99
                                     and cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) < 200
                                     and cast(reverse(
                                                  left(reverse(SelectedZones), patindex('%,%', reverse(SelectedZones))
                                                                               - 1)
                                              ) as int) < 200 then 'TV'
                                when cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) > 199
                                     and cast(reverse(
                                                  left(reverse(SelectedZones), patindex('%,%', reverse(SelectedZones))
                                                                               - 1)
                                              ) as int) > 199 then 'TS'
                                else 'DSB'
                            end
                        else ''
                    end
       ,Startzone = case
                        when (StartZone is null or StartZone = 'null' or StartZone = 'ul')
                             and (CountSelectedZones is null or CountSelectedZones = 99) then ''
                        when (StartZone is null or StartZone = 'null' or StartZone = 'ul')
                             and CountSelectedZones is not null
                             and CountSelectedZones < 99 then
                            integration.ACCT_Ticket_FromZoneAndToZone(SelectedZones, 0)
                        else StartZone
                    end
       ,Slutzone = case
                       when (EndZone is null or EndZone = 'null' or EndZone = 'ul')
                            and (CountSelectedZones is null or CountSelectedZones = 99) then ''
                       when (EndZone is null or EndZone = 'null' or EndZone = 'ul')
                            and CountSelectedZones is not null
                            and CountSelectedZones < 99 then
                           integration.ACCT_Ticket_FromZoneAndToZone(SelectedZones, 1)
                       else EndZone
                   end
       ,Startzonenavn = case
                            when ws.StartZoneName is null
                                 or StartZoneName = 'null'
                                 or StartZoneName = 'ul' then ''
                            else StartZoneName
                        end
       ,Slutzonenavn = case
                           when EndZoneName is null
                                or EndZoneName = 'null'
                                or EndZoneName = 'ul' then ''
                           else EndZoneName
                       end
       ,Passagertype
       ,Salgsmedie
       ,Faktureringsmetode
       ,[Web ordrenr.] = 'NAV' + isnull(cast(try_cast([Web Order No_] as bigint) as nvarchar(20)), [Web Order No_])
    -- 2021-06-10, JKJ: The above line was changed from the original definition " [Web ordrenr.] = 'NAV' + cast(cast([Web Order No_] as int) as nvarchar(20)) "
    -- This was done to make it robust to order numbers not being within the ranges of neither INT or BIGINT.
    -- The introduction af an order (90000000000000113160) made the view breaking down due to arithmetic overflow. This is nolonger the case.
    from
        data.ACCT_DotWebshop_Sale as ws (nolock)
        left join dim.Date as dt (nolock) on
            cast(ws.[Posting Date] as date) = dt.date
    where
        [Posting Date] >= '2017-01-15'
)
select
    *
from
    CTE_ACCT_DotWebshop_SaleEnriched se
where
    1 = 1
    -- and se.Salgsdato >= '2023-11-01' -- Salsdato
    -- and Bogføringsgruppe = 'rejse' --Bogføringsgruppe

GO

