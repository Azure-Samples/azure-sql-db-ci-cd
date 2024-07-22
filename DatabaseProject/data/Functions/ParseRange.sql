
CREATE function [data].[ParseRange](
    @list                 varchar(max),
    @listSeparator        varchar(2)=',',
    @intervalSeparator    varchar(2)='..'
)
returns @tbl table (
    RangeStart     varchar(100) not null,
    RangeEnd       varchar(100) not null
)
as

begin;
    --- Declarations, start values:
    declare @range varchar(max);
    set @list=nullif(@list, '');

    --- Start of loop:
    while (@list is not null) begin;
        --- @range is the current interval in the list
        set @range=left(@list,
            charindex(@listSeparator,
                @list+@listSeparator)-1);

        --- Truncate @list
        set @list=nullif(
            substring(@list,
                charindex(@listSeparator,
                    @list+@listSeparator)+1,
                len(@list)), '');

        --- Insert the current @range into the output table:
        insert into @tbl (RangeStart, RangeEnd)
        select
            ltrim(left(@range, charindex(@intervalSeparator, @range + @intervalSeparator) - 1)),
            ltrim(case when charindex(@intervalSeparator, @range) > 0 then substring(@range, charindex(@intervalSeparator, @range) + len(@intervalSeparator), len(@range)) else @range end)
    end;

    return;
end;

GO

