

create   function [integration].[ACCT_Ticket_FromZoneAndToZone]
    (
        @ZoneString nvarchar(max) -- Zonestreng (1 - 3 cifferede zonenumre adskildt af "," [Komma])
       ,@FromOrTo int -- 0 = From, 1 = To
    )
returns int
as
/*
Funktionen er introduceret i forbindelse med US Taiga #1832 (JKJ)

Funktionen finder start og slut zonerne i @ZoneString. 
@FromOrTo definerer om det er start zonen eller slut zonen der returneres.
En start og slutzone er defineret ved at der er een nabozone til zonen.
Funktionen benytter funktionen [dbo].[NabourZone]
*/
begin
    declare @TempZoneString nvarchar(max) = @ZoneString
    ;
    declare @Output int = 0
    ;
    declare @FromZone int = 0
    ;
    declare @ToZone int = 0
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

        if @FromZone = 0
        begin
            if integration.ACCT_Ticket_NabourZone(@Zone, @ZoneString, 1) = 1
                set @FromZone = @Zone
                ;
        end
        ;
        else
        begin
            if integration.ACCT_Ticket_NabourZone(@Zone, @ZoneString, 1) = 1
                set @ToZone = @Zone
                ;
        end
        ;

        set @TempZoneString = right(@TempZoneString, len(@TempZoneString) - patindex('%,%', @TempZoneString))
        ;
        set @i = @i - 1
        ;
    --		print concat(@TempZoneString,' - ',@Zone,' - ',@FromZone,' - ',@ToZone)
    end
    ;

    --	print concat(@FromZone,' - ',@ToZone)
    if @FromOrTo = 0
        set @Output = @FromZone
        ;
    else
        set @Output = @ToZone
        ;

    return @Output
    ;
end
;

GO

