


CREATE   view [data].[ACCT_Ticket_RosalinaSeasonPassEnriched]
as
/*
Viewet er introduceret i DWH i forbindelse med US Taiga #1832 (JKJ).

Beriger data fra Rosalina periodekort med diverse egenskaber.
Benytter funktionen "FromZoneAndToZone" til bestemmelse af start og slut zone.
Benytter funktionen "CheckZoneCombination" tilbestemmelse om zonekombinationen er gyldig.
Forudsætning for berigelsen med diverse egenskaber er takstsjælland ([Solgt_Datotid] >= '2017-01-15').
Benyttes af "View Periodekort Salg og Andre Salg Rosalina".
Der mangler reference til NAV transaktioner (Bogføringer), samt NAV transaktioner der ikke er i dette datasæt, 
men som indgår i omsætningen der er grundlaget for indtægtsfordelingen.

Viewet er opdateret jf. US (Taiga #1902), grundet Pensionistreformen 17.01.2021, hvor en række produkter blev
introduceret. I den forbindelse var det nødvendigt, at justere på forettningsreglerne (udledning) for særligt felterne:

   - Valgte zoner
   - Antal valgte zoner
   - Antal betalte zoner
   - Takstsæt

Koden for reglerne reduceret (hvor generaliseringer er muligt) og implementeret.
Desuden er koden forsimplet i forhold til den oprindelige implementering, hvor det har været muligt.
.
*/
select
    [Dokumentnr.] = ''
   ,[Salgsdato og -tid] = pk.Solgt_Datotid
   ,Salgsdato = cast(pk.Solgt_Datotid as date)
   ,Salgsår = dt.Year
   ,Salgsmåned = dt.MonthNo
   ,Salgsmånednavn = dt.Month
   ,[Salgsår og måned] = dt.YearMonthNo
   ,[Salgsår og månednavn] = dt.YearMonth
   ,[Varenr.] = fk.FinansKontoNavn
   ,Lokation = 'Rosalina'
   ,Beskrivelse = ni.ItemDescription
   ,Antal = iif(pk.Pris < 0, -1, 1)
   ,Beløb = pk.Pris
   ,Bogføringsgruppe = ''
   ,Periode_Fra = cast(pk.Periode_Fra as date)
   ,Periode_Til = cast(pk.Periode_Til as date)
   ,[Antal kort dage] = datediff(dd, pk.Periode_Fra, pk.Periode_Til) + 1
   ,calc.[Valgte zoner]
   ,[Antal valgte zoner] = len(calc.[Valgte zoner]) - len(replace(calc.[Valgte zoner], ',', '')) + 1
   ,calc.[Antal betalte zoner]
   ,Takstsæt = iif(
                   calc.[Antal betalte zoner] <> 0
                   and charindex(',', calc.[Valgte zoner]) - 1 > 0
                  ,case
                       when cast(left(calc.[Valgte zoner], charindex(',', calc.[Valgte zoner]) - 1) as int) < 100
                            and cast(reverse(left(reverse(calc.[Valgte zoner]), charindex(',', reverse(calc.[Valgte zoner])) - 1)) as int) < 100
                           then 'TH'
                       when cast(left(calc.[Valgte zoner], charindex(',', calc.[Valgte zoner]) - 1) as int) between 99 and 200
                            and cast(reverse(left(reverse(calc.[Valgte zoner]), charindex(',', reverse(calc.[Valgte zoner])) - 1)) as int) < 200
                           then 'TV'
                       when cast(left(calc.[Valgte zoner], charindex(',', calc.[Valgte zoner]) - 1) as int) > 199
                            and cast(reverse(left(reverse(calc.[Valgte zoner]), charindex(',', reverse(calc.[Valgte zoner])) - 1)) as int) > 199
                           then 'TS'
                       else 'DSB'
                   end
                  ,null)
   -- Beregnet ved hjælp af nabozoner
   ,Startzone = iif(
                    pk.Zoneantal between 1 and 83
                    or ni.ItemDescription like 'Pensionistkort DOT 3 Zoner%'
                   ,integration.ACCT_Ticket_FromZoneAndToZone(calc.[Valgte zoner], 0)
                   ,null)
   ,Slutzone = iif(
                   pk.Zoneantal between 1 and 83
                   or ni.ItemDescription like 'Pensionistkort DOT 3 Zoner%'
                  ,integration.ACCT_Ticket_FromZoneAndToZone(calc.[Valgte zoner], 1)
                  ,null)
   ,Passagertype = pp.Passagertype
   ,[Kortsalg Nr.] = pk.Kortsalg_Nr
   ,[Kortsalg Navn] = ks.Navn
   ,[Kortsalg Adresse] = ks.Adresse
   ,[Kortsalg Postnummer] = iif(ks.Postnummer_by is not null, left(ks.Postnummer_by, 4), null)
   ,[Kortsalg By] = iif(ks.Postnummer_by is not null, replace(right(ks.Postnummer_by, len(ks.Postnummer_by) - 4), ' ', ''), null)
   ,Salgsmedie = 'Rosalina'
   ,[Findes Stamkort] = iif(sk.Zoner is null, 'Nej', 'Ja')
   ,[Gyldig zonekombination] = iif(
                                   pk.Zoneantal between 1 and 83
                                   or ni.ItemDescription like 'Pensionistkort DOT 3 Zoner%'
                                  ,case
                                       when integration.ACCT_Ticket_CheckZoneCombination(calc.[Valgte zoner]) = 0
                                           then 'Ja'
                                       else 'Nej'
                                   end
                                  ,null)
   ,[Ugyldig zone] = iif(
                         pk.Zoneantal between 1 and 83
                         or ni.ItemDescription like 'Pensionistkort DOT 3 Zoner%'
                        ,case
                             when integration.ACCT_Ticket_CheckZoneCombination(calc.[Valgte zoner]) = 0
                                 then ''
                             else cast(integration.ACCT_Ticket_CheckZoneCombination(calc.[Valgte zoner]) as nvarchar(5))
                         end
                        ,null)
   ,pk.Solgt_Sekvens
--,[ExtraColumnsForTaiga1902->] = '***'
--,pk.Zoneantal
--,ZonerFraStamkort = sk.Zoner
--,ZonerFraPeriodeKort = pk.Zoner
from
    data.ACCT_Ticket_RosalinaSeasonPass as pk (nolock)
    left join data.ACCT_Ticket_RosalinaStamkort as sk (nolock) on
        pk.Stamkort_Nr = sk.Stamkort_Nr
        and pk.Stamkort_Blanket = sk.Stamkort_Blanket
    left join data.ACCT_Ticket_RosalinaFinansKontoNavne as fk (nolock) on
        (case
             when pk.TilFinanskonto = 174
                 then 17400
             else pk.TilFinanskonto
         end
        ) = fk.FinansKontoNr
    left join dim.ACCT_Erp_Item as ni (nolock) on
        fk.FinansKontoNavn = ni.ItemNo
    left join data.ACCT_Ticket_RosalinaPeriodekortProdukter as pp (nolock) on
        pk.PeriodekortType_Tag = pp.PeriodekortType_Tag
    cross apply (
    select
        [Valgte zoner] = case
                             when ni.ItemDescription = 'Pensionistkort DOT 3 Zoner'
                                 then pk.Zoner -- Individuelt for 3-zoners pensionistkort
                             when ni.ItemDescription = 'Pensionistkort DOT Øst'
                                 then '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99'
                             when ni.ItemDescription = 'Pensionistkort DOT Vest'
                                 then '110,111,112,113,114,115,116,117,120,121,122,123,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,150,160,161,162,163,164,165,170,171,173,174,176,177,180,181,184,185,190,191,192,193'
                             when ni.ItemDescription = 'Pensionistkort DOT Syd'
                                 then '210,211,212,213,214,215,216,217,218,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,243,244,245,246,247,248,250,251,252,253,254,255,256,257,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276,277,278'
                             when ni.ItemDescription = 'Pensionistkort DOT Midt'
                                 then '8,20,21,22,23,24,25,26,27,28,29,47,48,54,56,57,65,66,74,75,76,85,86,87,88,95,96,97,98,99,110,111,112,113,114,115,116,117,137,140,141,142,143,144,145,146,170,171,176,177,180,181,184,185,255,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276'
                             when ni.ItemDescription = 'Pensionistkort DOT Alle zoner'
                                 then '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,110,111,112,113,114,115,116,117,120,121,122,123,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,150,160,161,162,163,164,165,170,171,173,174,176,177,180,181,184,185,190,191,192,193,210,211,212,213,214,215,216,217,218,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,243,244,245,246,247,248,250,251,252,253,254,255,256,257,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276,277,278'
                             when ni.ItemDescription = 'Pensionistkort DOT Øst + DOT Vest'
                                 then '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,110,111,112,113,114,115,116,117,120,121,122,123,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,150,160,161,162,163,164,165,170,171,173,174,176,177,180,181,184,185,190,191,192,193'
                             when ni.ItemDescription = 'Pensionistkort DOT Øst + DOT Syd'
                                 then '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,210,211,212,213,214,215,216,217,218,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,243,244,245,246,247,248,250,251,252,253,254,255,256,257,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276,277,278'
                             when ni.ItemDescription = 'Pensionistkort DOT Øst + DOT Midt'
                                 then '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,110,111,112,113,114,115,116,117,137,140,141,142,143,144,145,146,170,171,176,177,180,181,184,185,255,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276'
                             when ni.ItemDescription = 'Pensionistkort DOT Vest + DOT Syd'
                                 then '110,111,112,113,114,115,116,117,120,121,122,123,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,150,160,161,162,163,164,165,170,171,173,174,176,177,180,181,184,185,190,191,192,193,210,211,212,213,214,215,216,217,218,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,243,244,245,246,247,248,250,251,252,253,254,255,256,257,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276,277,278'
                             when ni.ItemDescription = 'Pensionistkort DOT Vest + DOT Midt'
                                 then '8,20,21,22,23,24,25,26,27,28,29,47,48,54,56,57,65,66,74,75,76,85,86,87,88,95,96,97,98,99,110,111,112,113,114,115,116,117,120,121,122,123,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,150,160,161,162,163,164,165,170,171,173,174,176,177,180,181,184,185,190,191,192,193,255,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276'
                             when ni.ItemDescription = 'Pensionistkort DOT Midt + DOT Syd'
                                 then '8,20,21,22,23,24,25,26,27,28,29,47,48,54,56,57,65,66,74,75,76,85,86,87,88,95,96,97,98,99,110,111,112,113,114,115,116,117,137,140,141,142,143,144,145,146,170,171,176,177,180,181,184,185,210,211,212,213,214,215,216,217,218,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,243,244,245,246,247,248,250,251,252,253,254,255,256,257,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276,277,278'
                             when pk.Zoneantal = 84
                                 then '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99'
                             when pk.Zoneantal = 85
                                 then '110,111,112,113,114,115,116,117,120,121,122,123,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,150,160,161,162,163,164,165,170,171,173,174,176,177,180,181,184,185,190,191,192,193'
                             when pk.Zoneantal = 86
                                 then '210,211,212,213,214,215,216,217,218,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,240,241,242,243,244,245,246,247,248,250,251,252,253,254,255,256,257,260,261,262,263,264,265,266,267,268,269,270,272,273,274,275,276,277,278'
                             else coalesce(sk.Zoner, pk.Zoner)
                         end
       ,[Antal betalte zoner] = case
                                    when ItemDescription = 'Pensionistkort DOT 3 Zoner'
                                        then 3
                                    when ItemDescription = 'Pensionistkort DOT Alle zoner'
                                        then 300
                                    when ItemDescription like 'Pensionistkort DOT % + DOT %'
                                        then 200
                                    when ItemDescription like 'Pensionistkort DOT %'
                                        then 99
                                    when pk.Zoneantal > 0
                                         and pk.Zoneantal < 84
                                        then len(coalesce(sk.Zoner, pk.Zoner)) - len(replace(coalesce(sk.Zoner, pk.Zoner), ',', '')) + 1
                                    when pk.Zoneantal >= 84
                                         and pk.Zoneantal <= 86
                                        then 99
                                    else 0
                                end
) as calc
    left join data.ACCT_Ticket_RosalinaKortsalg as ks (nolock) on
        pk.Kortsalg_Nr = ks.Kortsalg_Nr
    left join dim.Date as dt (nolock) on
        cast(pk.Solgt_Datotid as date) = dt.Date
where
    cast(pk.Solgt_Datotid as date) >= '2017-01-15'
    and (
        sk.PeriodekortType_Tag != 'ANNULLERET'
        or sk.PeriodekortType_Tag is null
    )
    and pk.PeriodekortType_Tag != 'ANNULLERET'
	and pk.Pris>0
;

GO

