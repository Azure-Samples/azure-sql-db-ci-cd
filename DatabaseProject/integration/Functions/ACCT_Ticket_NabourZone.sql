

create   function [integration].[ACCT_Ticket_NabourZone]
    (
        @Zone int -- Zonenummer (1 - 3 cifferet zonenummer)
       ,@ZoneString nvarchar(max) -- Zonestreng (1 - 3 cifferede zonenumre adskildt af "," [Komma])
       ,@ToFromOnly int -- 1 for Fra / til zone beregning - 0 for alt 
    )
returns int
as
/*
Funktionen er introduceret i DWH i forbindelse med US Taiga #1832 (JKJ)

Funktionen benytter tabellen [dbo].[Nabozoner] som forventes at ligge i samme database som funktionen.
Funktionen finder antallet af nabozoner i @ZoneString til zonen @Zone
Da der i Nabozonerelationerne er nogle teoretiske kombinationer der støjer når funktionen benyttes i forbindelse 
med funktionen [dbo].[FromZoneAndToZone] er disse konbinationer markeret med 0 i tabellen, felt [dbo].[Nabozoner].[FraTil]

I forbindelse med US #1832 hvor feltet FraTil ikke eksisterer i pendanten til tabellen Nabozoner er "støjen" håndteret 
ved hardkodning af de to kombinationer hvor kombinationen af nabozoner ikke har værdien 1 i feltet Fratil.
*/
begin
    declare @Output int = 0
    ;
    declare @NabourZone int = 0
    ;
    declare @i int = len(@ZoneString) - len(replace(@ZoneString, ',', '')) + 1
    ;

    while @i > 0
    begin
        set @NabourZone = cast((case
                                    when patindex('%,%', @ZoneString) > 0
                                        then left(@ZoneString, patindex('%,%', @ZoneString) - 1)
                                    else @ZoneString
                                end
                               ) as int)
        ;
        set @Output = @Output + (case
                                     when @ToFromOnly = 1
                                         then (
                                         --select
                                         --    count(ToZoneRef)
                                         --from
                                         --   data.GIS_TariffZoneAdjacent
                                         --where
                                         --    FromZoneRef = @Zone
                                         --    and ToZoneRef = @NabourZone
                                         --    and FraTil = 1
                                         select
                                             count(ToZoneRef)
                                         from
                                             data.GIS_TariffZoneAdjacent
                                         where
                                             FromZoneRef = 1000+@Zone
                                             and ToZoneRef = 1000+@NabourZone
                                             and not SourceSystemEntryRef in
                                     (
                                         '1140:1262'
                                        ,'1262:1140'
                                     )
                                     )
                                     else (
                                     select
                                         count(ToZoneRef)
                                     from
                                         data.GIS_TariffZoneAdjacent
                                     where
                                         FromZoneRef = 1000+@Zone
                                         and ToZoneRef = 1000+@NabourZone
                                 )
                                 end
                                )
        ;
        set @ZoneString = right(@ZoneString, len(@ZoneString) - patindex('%,%', @ZoneString))
        ;
        set @i = @i - 1
        ;
    --		print concat(@ZoneString,' - ',@NabourZone,' - ',@Output,' - ',patindex('%,%', @ZoneString))
    end
    ;

    --	print @Output
    return @Output
    ;
end
;

GO

