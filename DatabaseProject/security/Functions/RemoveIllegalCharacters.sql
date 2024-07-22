create function [security].[RemoveIllegalCharacters] (@Temp nvarchar(max))
returns nvarchar(max)
as
begin

    declare @KeepValues as varchar(50);
    set @KeepValues = '%[^ a-zA-Z0-9ÆØÅæøå.,]%';
    while patindex(@KeepValues, @Temp) > 0
    set @Temp = stuff(@Temp, patindex(@KeepValues, @Temp), 1, '');

    return @Temp;
end;

GO

