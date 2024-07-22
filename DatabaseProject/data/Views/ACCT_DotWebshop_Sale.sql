

CREATE view [data].[ACCT_DotWebshop_Sale]
as
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
                              ss, -1, cast(substring(PeriodAsJson, charindex(',', PeriodAsJson) + 15, 10) as datetime)
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
                                                                        - (patindex('%SelectedZones%', wo.JourneyAsJson)
                                                                           + len('SelectedZones') + 2
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
    data.ACCT_Erp_SalesInvoice as si (nolock)
    left join data.ACCT_DotWebshop_SalesOrder as wo (nolock) on
        si.[Web Order No_] = wo.[Webshop Order No_] -- collate Danish_Norwegian_CI_AS
        and si.[Line No_] = wo.[Line No_];

GO

