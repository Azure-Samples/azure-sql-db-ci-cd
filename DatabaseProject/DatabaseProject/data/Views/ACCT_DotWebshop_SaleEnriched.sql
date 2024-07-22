

create     view [data].[ACCT_DotWebshop_SaleEnriched]
as
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
   ,Lokation = '' -- [Location Code]: Not included in data from NAV/BCOP
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
   ,Periode_Fra = case
                      when PeriodeStart is null
                          then ''
                      else PeriodeStart
                  end
   ,Periode_Til = case
                      when PeriodeSlut is null
                          then ''
                      else PeriodeSlut
                  end
   ,[Antal kort dage] = case
                            when [Antal kort dage] is null
                                then ''
                            else [Antal kort dage]
                        end
   ,[Valgte zoner] = case
                         when SelectedZones is null
                             then ''
                         else SelectedZones
                     end
   ,[Antal valgte zoner] = case
                               when CountSelectedZones is null
                                   then ''
                               else CountSelectedZones
                           end
   ,[Antal betalte zoner] = case
                                when CountPaidZones is null
                                    then ''
                                else CountPaidZones
                            end
   ,Takstsæt = case
                   when SelectedZones is not null
                       then case
                                when cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) < 100
                                     and cast(reverse(left(reverse(SelectedZones), patindex('%,%', reverse(SelectedZones)) - 1)) as int) < 100
                                    then 'TH'
                                when cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) > 99
                                     and cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) < 200
                                     and cast(reverse(left(reverse(SelectedZones), patindex('%,%', reverse(SelectedZones)) - 1)) as int) < 200
                                    then 'TV'
                                when cast(left(SelectedZones, patindex('%,%', SelectedZones) - 1) as int) > 199
                                     and cast(reverse(left(reverse(SelectedZones), patindex('%,%', reverse(SelectedZones)) - 1)) as int) > 199
                                    then 'TS'
                                else 'DSB'
                            end
                   else ''
               end
   ,Startzone = case
                    when (
                        StartZone is null
                        or StartZone = 'null'
                        or StartZone = 'ul'
                    )
                         and (
                             CountSelectedZones is null
                             or CountSelectedZones = 99
                         )
                        then ''
                    when (
                        StartZone is null
                        or StartZone = 'null'
                        or StartZone = 'ul'
                    )
                         and CountSelectedZones is not null
                         and CountSelectedZones < 99
                        then integration.ACCT_Ticket_FromZoneAndToZone(SelectedZones, 0)
                    else StartZone
                end
   ,Slutzone = case
                   when (
                       EndZone is null
                       or EndZone = 'null'
                       or EndZone = 'ul'
                   )
                        and (
                            CountSelectedZones is null
                            or CountSelectedZones = 99
                        )
                       then ''
                   when (
                       EndZone is null
                       or EndZone = 'null'
                       or EndZone = 'ul'
                   )
                        and CountSelectedZones is not null
                        and CountSelectedZones < 99
                       then integration.ACCT_Ticket_FromZoneAndToZone(SelectedZones, 1)
                   else EndZone
               end
   ,Startzonenavn = case
                        when StartZoneName is null
                             or StartZoneName = 'null'
                             or StartZoneName = 'ul'
                            then ''
                        else StartZoneName
                    end
   ,Slutzonenavn = case
                       when EndZoneName is null
                            or EndZoneName = 'null'
                            or EndZoneName = 'ul'
                           then ''
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
        cast(ws.[Posting Date] as date) = dt.Date
where
    [Posting Date] >= '2017-01-15'
;

GO

