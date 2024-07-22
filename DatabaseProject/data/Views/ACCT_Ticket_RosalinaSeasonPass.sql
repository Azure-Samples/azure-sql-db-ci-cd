

CREATE view [data].[ACCT_Ticket_RosalinaSeasonPass]
as
/*
Viewet er introduceret i DWH i forbindelse med US Taiga #1832 (JKJ).

Dette view erstatter tabellen Periodekort i Rosalina databasen, sådan at direkte tilbageførsler er en konmination af oprindelig
transaktion i Periodekort tabellen og en transaktion i tabellen Andresalg i Rosalina databasen.
Nøglen er [Periodekort].[Retur_Transaktion] = [AndreSalg].[Salg_Id]
Benyttes af "View Periodekort Salg Rosalina zoner".
*/
select
    Periodekort_Id
   ,Periodekort_Nr
   ,Periodekort_Blanket
   ,PeriodekortType_Tag
   ,Stamkort_Blanket
   ,Stamkort_Nr
   ,Periode_Fra
   ,Periode_Til
   ,Zoneantal
   ,Zoner
   ,Kortsalg_Nr
   ,Solgt_Datotid
   ,Solgt_Sekvens
   ,Solgt_Bruger
   ,Regnskab_Sekvens
   ,Pris
   ,Retur_Transaktion
   ,Kommission_Datotid
   ,Oprettet_Datotid
   ,Rabat
   ,FraFinanskonto
   ,FraSektionsNr
   ,FraProjektNr
   ,TilFinanskonto
   ,TilSektionsNr
   ,TilProjektNr
   ,Kunde_Id
   ,Foedselsdato
   ,CPR
   ,SalgsType = 'SALG'
   ,Id
from
    data.ACCT_Ticket_RosalinaPeriodekort (nolock)
union all
select
    Periodekort_Id
   ,Periodekort_Nr
   ,Periodekort_Blanket
   ,PeriodekortType_Tag
   ,Stamkort_Blanket
   ,Stamkort_Nr
   ,Periode_Fra
   ,Periode_Til
   ,Zoneantal
   ,Zoner
   ,Kortsalg_Nr
   ,Solgt_Datotid
   ,Solgt_Sekvens
   ,Solgt_Bruger
   ,Regnskab_Sekvens
   ,Pris
   ,Retur_Transaktion
   ,Kommission_Datotid
   ,Oprettet_Datotid
   ,Rabat
   ,FraFinanskonto
   ,FraSektionsNr
   ,FraProjektNr
   ,TilFinanskonto
   ,TilSektionsNr
   ,TilProjektNr
   ,Kunde_Id
   ,Foedselsdato
   ,CPR
   ,SalgsType
   ,Id
from
    data.ACCT_Ticket_RosalinaAndreSalg (nolock)
;

GO

