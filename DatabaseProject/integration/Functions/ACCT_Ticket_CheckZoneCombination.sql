

create function [integration].[ACCT_Ticket_CheckZoneCombination]
    (
        @ZoneString nvarchar(max) -- Zonestreng (1 - 3 cifferede zonenumre adskildt af "," [Komma])
    )
returns int
as
/*
Funktionen er introduceret i forbindelse med US Taiga #1832 (JKJ)

Funktionen tjekker om en zone i @ZoneString er uden relation til de øvrige zoner i @ZoneString 
for at bestemme om zone kombinationen i @ZoneString er gyldig.
Funktionen returnerer 0 hvis zone kombinationen er gyldig eller den første zone i kombinationen der ikke har relationer til de øvrige.
Funktionen benytter funktionen [dbo].[NabourZone]
*/
begin
    declare @TempZoneString nvarchar(max) = @ZoneString
    ;
    declare @Output int = 0
    ;
    declare @Zone int = 0
    ;
    declare @i int = len(@ZoneString) - len(replace(@ZoneString, ',', '')) + 1
    ;

    while @i > 0
    begin
        set @Zone = cast((case
                              when patindex('%,%', @TempZoneString) > 0
                                  then left(@TempZoneString, patindex('%,%', @TempZoneString) - 1)
                              else @TempZoneString
                          end
                         ) as int)
        ;

        if @Output = 0
        begin
            if integration.ACCT_Ticket_NabourZone(@Zone, @ZoneString, 0) = 0
                set @Output = @Zone
                ;
        end
        ;

        if @Output != 0
            break
            ;

        set @TempZoneString = right(@TempZoneString, len(@TempZoneString) - patindex('%,%', @TempZoneString))
        ;
        set @i = @i - 1
        ;
    end
    ;

    --	print concat(@TempZoneString,' - ',@Zone,' - ',@Output)
    return @Output
    ;
end
;

GO

